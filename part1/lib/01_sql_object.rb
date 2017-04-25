require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    columns = DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        "#{table_name}"
    SQL
    columns.map! {|c| c.to_sym}
    @columns = columns
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) {self.attributes[col]}
      define_method("#{col}=") {|val| self.attributes[col] = val}
    end

  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    table = self.name
    table = table[0].downcase + table.slice(1..-1)
    table << "s"
  end

  def self.all
    table = self.table_name
    entries = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        "#{table}"
    SQL
    self.parse_all(entries)
  end

  def self.parse_all(results)
    objects = []
    results.each do |hash|
      objects << new(hash)
    end
    objects
  end

  def self.find(id)
    table = self.table_name
    entry = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        "#{table}"
      WHERE
        id = ?

    SQL
    return nil if entry.length == 0
    new(entry.first)
  end

  def initialize(params = {})
    symbols = {}
    params.each {|k, v| symbols[k.to_sym] = v}
    params = symbols
    cols = self.class.columns
    params.each_pair.each do |col, v|
      raise "unknown attribute '#{col}'" if !cols.include?(col)
      self.send("#{col}=", v)
    end
  end

  def attributes
    @attributes = {} if @attributes.nil?
    @attributes

  end

  def attribute_values
    vals = self.class.columns.map {|c| self.send("#{c}")}
  end

  def insert
    cols = self.class.columns.join(',')
    q_marks = ["?"] * cols.split(",").size
    q_marks = q_marks.join(",")
    table = self.class.table_name
    DBConnection.execute(<<-SQL, self.attribute_values)
      INSERT INTO
        #{table} (#{cols})
      VALUES
        (#{q_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    cols = self.class.columns
    cols = cols.map {|c| "#{c} = ?"}.join(",")
    table = self.class.table_name
    DBConnection.execute(<<-SQL, self.attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{cols}
      WHERE
        #{self.class.table_name}.id = ?
    SQL
  end

  def save
    if self.id.nil?
      self.insert
    else
      self.update
    end
  end
end
