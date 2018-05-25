require 'byebug'
class PolyTreeNode
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent
    @parent
  end
  
  def children
    @children
  end
  
  def value
    @value
  end
  
  def parent=(node)
    if parent 
      parent.children.reject! {|child| child == self}
    end
    
    @parent = node
    if !node.nil? && !node.children.include?(self)
      node.children << self
    end
  end
  
  def add_child(child)
      child.parent = self 
  end
  
  def remove_child(child)
    raise "error" unless children.include?(child)
    child.parent = nil
  end
  
  def dfs(target_value)
    return self if self.value == target_value
    return nil if self.children.empty?
    
    self.children.each do |child|
      search_result = child.dfs(target_value)
      return search_result unless search_result.nil? 
    end
    
    nil
  end
  
  def bfs(target_value)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      node.children.each do |child|
        queue << child 
      end
    end
    nil
  end
  
  def to_s
    self.children.map {|node| node.value}
  end
end
