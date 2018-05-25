require_relative "polytreenode.rb"

class KnightPathFinder
  
  MOVE_DIFFS = [
    [2,-1], [2,1], [1,2], [-1,2], 
  [-2,1], [-2,-1], [-1,-2], [1,-2]
]

  attr_reader :visited_positions, :pos, :move_tree
  
  def initialize(initial_pos)
    @pos = initial_pos
    @visited_positions = {}
  end
  
  def find_path
    
  end
  
  def new_move_positions(pos)
    valid_moves = KnightPathFinder.valid_moves(pos)
    new_moves = valid_moves.reject {|pos| visited_positions[pos]}
    new_moves.each { |pos| visited_positions[pos] = true }
    
    new_moves
  end
  
  def self.valid_moves(pos)
    moves = []
    MOVE_DIFFS.each do |diff|
      new_x = pos[0] + diff[0]
      next unless self.valid_coord?(new_x)
      new_y = pos[1] + diff[1]
      next unless self.valid_coord?(new_y)
      moves << [new_x, new_y]
    end
    
    moves
  end
  
  def build_move_tree
    root_node = PolyTreeNode.new(pos)
    queue = [root_node]
    until queue.empty? 
      node = queue.shift
      new_moves = new_move_positions(node.value)
      new_moves.each do |move|
        new_node = PolyTreeNode.new(move)
        queue << new_node
        new_node.parent = node 
      end
    end
    @move_tree = root_node
    
  end
  
  # def bfs(target_value)
  #   queue = [self]
  #   until queue.empty?
  #     node = queue.shift
  #     return node if node.value == target_value
  #     node.children.each do |child|
  #       queue << child 
  #     end
  #   end
  #   nil
  # end
  
  def find_path
    
  end
  
  private
  
  def self.valid_coord?(coord)
    coord >= 0 && coord <= 7
  end
end


kpf = KnightPathFinder.new([0,0])
p kpf.build_move_tree
# p KnightPathFinder.valid_moves([0,0])
# p KnightPathFinder.valid_moves([5, 5]).uniq
# p KnightPathFinder.valid_moves([7, 7])
