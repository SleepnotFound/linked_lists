class LinkedList
  attr_accessor :head, :tail
  
  def initialize
    @head = nil
    @tail = nil
  end
  
  def append(value)
    if self.head.nil?
      new_node = Node.new(value)
      self.head = new_node
      self.tail = new_node
    else
      self.tail = Node.new(value)
      pointer = self.head
      until pointer.next_node.nil?
        pointer = pointer.next_node
      end
      pointer.next_node = self.tail
    end
  end

  def prepend(value)
    if self.head.nil?
      new_node = Node.new(value)
      self.head = new_node
      self.tail = new_node
    else
      new_head = Node.new(value)
      new_head.next_node = self.head
      self.head = new_head
    end
  end

  def size 
    return 0 if self.head.nil?

    i = 1
    pointer = self.head
    until pointer.next_node.nil?
      pointer = pointer.next_node
      i += 1
    end
    i
  end

  def at(index)
    pointer = self.head
    index.times do
      pointer = pointer.next_node
    end
    pointer
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
list.append(42)
#p list
list.append(69)
#p list
list.append(420)
#p list
list.prepend("IM the head")
p list

puts "size:#{list.size}"
puts list.head
puts list.tail
puts list.at(2)
