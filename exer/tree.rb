class Tree

  attr_accessor :parent, :value, :children

  def initialize(value)
    @value = value
    @children = []
  end

  def parent=(node)
    if !@parent.nil?
      @parent.children.delete(self)
    end
    @parent = node
    if !@parent.nil?
      @parent.children << self
    end
  end

  def add_child(node)
    node.parent(self)
  end

  def bfs(target)
    queue = [self]
    while !queue.empty?
      current = queue.shift
      return current if current.value == target
      current.children.each {|ch| queue << ch}
    end
    nil
  end

  def dfs(target)
    stack = [self]
    while !stack.empty?
      current = stack.pop
      return current if current.value == target
      current.children.each {|ch| stack << ch}
    end
  end

end

tree0 = Tree.new(0)

tree1 = Tree.new(1)
tree2 = Tree.new(2)

tree1.parent = tree0
tree2.parent = tree0

tree3 = Tree.new(3)
tree4 = Tree.new(4)

tree3.parent = tree2
tree4.parent = tree2

p tree0.bfs(4).value

p tree0.dfs(4).value
