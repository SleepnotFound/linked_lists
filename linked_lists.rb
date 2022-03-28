class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    if head.nil?
      self.head = Node.new(value)
    else
      each_node do |node|
        if node.next_node.nil?
          node.next_node = Node.new(value)
          break
        end
      end

    end
  end

  def prepend(value)
    new_head = Node.new(value)
    new_head.next_node = head unless head.nil?
    self.head = new_head
  end

  def tail
    each_node do |node|
      return node if node.next_node.nil?
    end
  end

  def size
    i = 0
    each_node { |_node| i += 1 }
    i
  end

  def at(index)
    each_node do |node|
      return node if index.zero?

      index -= 1
    end
  end

  def pop
    each_node do |node|
      next unless node.next_node.next_node.nil?

      pop = node.next_node
      node.next_node = nil
      return pop
    end
  end

  def contains?(value)
    each_node { |node| return true if node.value == value }
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
    string = ''
    each_node do |node|
      string << '(' << node.value.to_s << ') -> '
    end
    string << 'nil'
  end

  def insert_at(value, index)
    i = 0
    each_node do |node|
      if index.zero?
        prepend(value)
        break
      elsif index == i + 1
        insert_node = Node.new(value, at(index))
        node.next_node = insert_node
        break
      else
        i += 1
      end
    end
    self
  end

  def remove_at(index)
    sliced = at(index).next_node
    i = 0
    each_node do |node|
      if index.zero?
        self.head = sliced
        break
      elsif index == i + 1
        node.next_node = sliced
        break
      else
        i += 1
      end
    end
    self
  end

  def each_node
    pointer = head
    until pointer.nil?
      yield pointer
      pointer = pointer.next_node
    end
  end
end
