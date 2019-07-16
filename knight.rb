require_relative "tree"


class KnightPathFinder 


    def initialize(position)
        @root_node = PolyTreeNode.new(position)
        @board = Array.new(8) do |i|
            Array.new(8) {|j| PolyTreeNode.new([i, j])}
        end
        @considered_positions = [position]

        build_move_tree
    end

     def self.valid_moves(pos)
         def adjacent(array, row, col)
            rows_ndx = array.each_index.select { |i| (i-row).abs < 2 }
            cols_ndx = array.first.size.times.select { |j| (j-col).abs < 2 }
            rows_ndx.each_with_object([]) do |i,a| 
            cols_ndx.each { |j| a << array[i][j] unless [i,j] == [row,col] }
            end
        end

        row, col = pos
        array = @board 

        return adjacent(array, row, col)
    end


    def build_move_tree
    end 



    def new_move_positions(pos)
    end
    
end 