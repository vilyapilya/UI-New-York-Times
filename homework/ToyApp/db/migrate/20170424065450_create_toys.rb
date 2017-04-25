class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :name
      t.integer :toyable_id
      t.string :toyable_type
      t.references :toyable, polymorphic: true, index: true
      t.timestamps null: false
    end
    add_index :toys, [:name, :toyable_id, :toyable_type], unique: true
  end
end
