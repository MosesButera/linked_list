# frozen_string_literal: true

require_relative 'lib/node'
require_relative 'lib/Linked_list'

list = LinkedList.new

list.append("A")
list.append("B")
list.append("C")
list.append("D")
list.append("E")
list.prepend("X")

list.print_list
list.size
list.head
list.tail
list.at(1)
list.at(2)
list.at(4)
list.at(6)
list.at(7)
list.pop
list.print_list
list.index("C")
list.index("E")
list.index("A")
list.insert_at(1, "1", "2", "3", "4")
list.print_list
list.remove_at(3)
list.print_list