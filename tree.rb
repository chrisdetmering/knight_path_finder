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

    def parent=(new_parents_value)
        if (@parent != new_parents_value) && (@parent != nil)
            @parent.children.delete(self)
        end

        @parent = new_parents_value
        
       if new_parents_value
        @parent.children.push(self) unless @parent.children.include?(self) 
       end 
    end 

    def add_child(child_node)
        child_node.parent = self 

        @children.push(child_node) unless @children.include?(child_node)
    end 

    def remove_child(child_node)
        child_node.parent = nil 

        @children.include?(child_node) ? @children.delete(child_node) : raise 
    end 


    def dfs(target)

        return self if self.value == target 

        self.children.each do |child| 
           search_result = child.dfs(target)

           return search_result unless search_result.nil? 
        end 

        nil
    end 

    def bfs(target)
        queue = [self]

        until queue.empty? 
            ele = queue.shift 

            return ele if ele.value == target 

            ele.children.each do |child| 
                queue << child
            end 
        end 

        nil
    end 



end