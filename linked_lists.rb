class LinkedList
  attr_accessor :head, :tail
  
  def initialize
    @head = nil
    @tail = nil
  end
  
  def append(value)
    self.tail = Node.new(value)
    if self.head.nil?
      self.head = self.tail
    else
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
    i = 0
    each_node { |node| i += 1 }
    i
  end

  def at(index)
    each_node do |node|
      return node if index == 0
      index -= 1
    end
  end

  def pop
    pop_tail = self.tail
    each_node do |node| 
      if node.next_node == self.tail
        self.tail = node
        node.next_node = nil 
      end
    end
    pop_tail
  end

  def contains?(value)
    each_node { |node| return true if node.value == value}
    false
  end

  def find(value)
    i = 0
    each_node do |node|
      return i if node.value == value
      i += 1
    end
    nil
  end

  def to_s
    string = ""
    each_node do |node|
      string << "(" << node.value.to_s << ") -> "
    end
    string << "nil"
  end

  def each_node
    pointer = self.head
    until pointer.nil?
      yield pointer
      pointer = pointer.next_node
    end
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
#puts list.head
#puts list.tail
puts "node at index 2:#{list.at(2)}"
puts list.to_s
last_element = list.pop
puts "pop: #{last_element}"
p last_element
#p list
puts "size after pop: #{list.size}"

puts "contains 420? :#{list.contains?(420)}"
puts "contains 42? :#{list.contains?(42)}"

puts "69 at index:#{list.find(69)}"
puts "420 at index:#{list.find(420)}"
puts list.to_s