require_relative './node'
class Linked_list
    attr_accessor :head, :tail
    attr_reader :size
    def initialize()
        @head = nil
        @tail = nil
        @size = 0
    end

    def append(value)
        if  @head == nil
            @head = @tail = Node.new(value)
        else
            @tail.next_node = Node.new(value)
            @tail = @tail.next_node
        end
        @size += 1
    end

    def prepend(value)
        if  @head == nil
            @head = @tail = Node.new(value, @tail)
        else
            node = Node.new(value, @head)
            @head = node
        end
        @size += 1
    end

    def size
        return @size
    end

    def head
        return @head
    end

    def tail
        return @tail
    end

    def at(index)
        raise "Invalid index" if index + 1 > @size || index < 0 
        cur_node = @head

        index.times do
            return nil if cur_node == nil
            cur_node = cur_node.next_node
        end

        return cur_node
    end
 
    def pop
        node = Node.new(@tail.value, @tail.next_node)
        cur_node = @head

        while cur_node.next_node != @tail
            cur_node = cur_node.next_node
        end

        @tail = cur_node
        @tail.next_node = nil
        @size -= 1

        return node
    end

    def contains?(value)
        cur_node = head

        while cur_node != nil
            return true if cur_node.value == value
            cur_node = cur_node.next_node
        end

        return false
    end
    
    def find(value)
        cur_node = head
        i = 0
        while cur_node != nil
            return i if cur_node.value == value
            cur_node = cur_node.next_node
            i += 1
        end
        return nil
    end

    def to_s
        cur_node = head
        str = ""
        while cur_node != nil
            str += "( #{cur_node.value.to_s} ) ->"
            cur_node = cur_node.next_node
        end
        return str += " nil"
    end

    def insert_at(value, index)
        raise "Invalid index" if index + 1 > @size || index < 0 

        if index == 0
            new_node = Node.new(value, @head)
            @head = new_node
        else
            cur_node = @head

            (index - 1).times do
                cur_node = cur_node.next_node
            end
            
            new_node = Node.new(value, cur_node.next_node)
            cur_node.next_node = new_node
        end
        @size += 1
    end

    def remove_at(index)
        raise "Invalid index" if index + 1 > @size || index < 0 

        node = @head
        
        if(index == 0)
            node = node.next_node
            @head = node
        else
            (index - 1).times do
                node = node.next_node
            end
            node.next_node = node.next_node.next_node
        end 
        @size -= 1
    end
end