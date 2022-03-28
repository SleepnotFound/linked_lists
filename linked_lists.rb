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
      each_node do |node| 
        if node.next_node.nil?
          node.next_node = self.tail 
          break
        end
      end
        
    end
  end

  def prepend(value)
    new_head = Node.new(value)
    if self.head.nil?
      self.head = new_head
      self.tail = new_head
    else
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

  def insert_at(value, index)
    i = 0
    each_node do |node|
      if index == 0 
        self.prepend(value)
        break 
      elsif index == i + 1
        insert_node = Node.new(value, self.at(index))
        node.next_node = insert_node 
        break
      else
        i += 1
      end
    end
    self
  end

  def remove_at(index)
    right = self.at(index)
    right = right.next_node
    i = 0
    each_node do |node|
      if index == 0
        self.head = right
        break
      elsif index == i + 1
        node.next_node = right
        break
      else
        i += 1
      end
    end
    self
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
puts list.to_s
list.append(42)
list.append(69)
list.append(420)
list.prepend("IM the head")
puts list.to_s
puts "head: #{list.head}"
puts "tail: #{list.tail}"
puts "size:#{list.size}"

puts "node at index 2:#{list.at(2)}"
last_element = list.pop
p "pop: #{last_element}"
p last_element
puts "size after pop: #{list.size}"

puts "contains 420? :#{list.contains?(420)}"
puts "contains 42? :#{list.contains?(42)}"
puts "69 at index:#{list.find(69)}"
puts "420 at index:#{list.find(420)}"
puts list.to_s

puts list.insert_at(34, 0)
puts list.insert_at(777, 2)
puts list.remove_at(3)
puts list.remove_at(0)