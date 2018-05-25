class KnightPathFinder
  
  MOVE_DIFFS = [
    [2,-1], [2,1], [1,2], [-1,2], 
  [-2,1], [-2,-1], [-1,-2], [1,-2]
]

  def initialize(initial_pos)
    @pos = initial_pos
    @visted_positions = []
  end
  
  def find_path
    
  end
  
  def new_move_positions
    
  end
  
  def self.valid_moves(pos)
    #checks if potential move is inside grid
    #checks visted positions 
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
    
  end
  
  def find_path
    
  end
  
  private
  
  def self.valid_coord?(coord)
    coord >= 0 && coord <= 7
  end
end

# p KnightPathFinder.valid_moves([0,0])
# p KnightPathFinder.valid_moves([5, 5]).uniq
# p KnightPathFinder.valid_moves([7, 7])
