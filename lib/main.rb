require_relative 'linked_list'
require_relative 'node'

my_list = Linked_list.new
# puts my_list
my_list.append('last')
# puts my_list
my_list.prepend('first')
puts my_list
puts "Size: #{my_list.size}"
puts "Head: #{my_list.head.value}"
puts "Tail: #{my_list.tail.value}"
puts "At 1: #{my_list.at(1).value}"

my_list.pop
puts "Size: #{my_list.size}"
puts my_list
puts "Contains 'first': #{my_list.contains?('first')}"
puts "Contains 'last': #{my_list.contains?('last')}"
puts "Index of 'first': #{my_list.find('first')}"

my_list.insert_at('new_first', 0)
puts my_list
puts "Size: #{my_list.size}"

my_list.remove_at(0)
puts my_list
puts "Size: #{my_list.size}"

my_list.insert_at('new_last', 1)
puts my_list
puts "Size: #{my_list.size}"

my_list.remove_at(1)
puts my_list
puts "Size: #{my_list.size}"
