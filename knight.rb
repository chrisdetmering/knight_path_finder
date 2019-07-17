require_relative "tree"


class KnightPathFinder 

attr_reader :start_pos

   MOVES = [
    [-1, -1],
    [-1,  0],
    [-1,  1],
    [ 0, -1],
    [ 0,  1],
    [ 1, -1],
    [ 1,  0],
    [ 1,  1]
  ]

    def initialize(start_pos)
        @start_pos = start_pos
        @considered_positions = [start_pos]

        build_move_tree
    end

    def find_path(end_pos)
        end_node = root_node.bfs(end_pos)

    end

    def trace_path_back(end_node)
        path = []

        until path.first == start_pos
        end 

        path 
    end 

    def self.valid_moves(pos)
        valid_moves = []
        
        cur_x, cur_y = pos 

        MOVES.each do |(dx, dy)| 
            next_pos = [cur_x + dx, cur_y + dy]

            if next_pos.all? {|coord| coord.between?(0, 7)}
                valid_moves << next_pos 
            end 
        end 
        
        valid_moves
    end


    def new_move_positions(pos)
       new_positions = []

        KnightPathFinder.valid_moves(pos).each do |position| 
            if !@considered_positions.include?(position)
                new_positions.push(position)
                @considered_positions.push(position)
            end
        end 

        new_positions
    end 

    attr_accessor :root_node

    def build_move_tree 
        self.root_node = PolyTreeNode.new(start_pos)
        nodes = [root_node]

        until nodes.empty? 
           
            current_node = nodes.shift

            current_pos = current_node.value

            new_move_positions(current_pos).each do |new_position| 
                new_node = PolyTreeNode.new(new_position)
                current_node.add_child(new_node)
                
                nodes << new_node
            end 
        end 
    end 

    
    
end 

new_search = KnightPathFinder.new([1, 1])

puts new_search.find_path([7, 5]) 