require_relative 'linked_lists'

list = LinkedList.new
puts list.to_s
list.append(33)
list.append(22)
list.append(99)
list.prepend('Head of list')
# p list
puts list.to_s
puts "head: #{list.head}"
puts "tail: #{list.tail}"
puts "size:#{list.size}"

puts "node at index 2:#{list.at(2)}"
last_element = list.pop
p "pop: #{last_element}"
p last_element
puts "size after pop: #{list.size}"

puts "contains 99? :#{list.contains?(99)}"
puts "contains 22? :#{list.contains?(22)}"
puts "33 at index:#{list.find(33)}"
puts "99 at index:#{list.find(99)}"
puts list.to_s

puts list.insert_at('New head', 0)
puts list.insert_at(11, 4)
puts list.remove_at(0)
puts list.remove_at(3)
p list.tail
