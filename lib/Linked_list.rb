# frozen_string_literal: true

require_relative 'node'

class LinkedList

  def initialize
    @head = nil
  end
  
  def append(value)
    new_node = Node.new(value)

    if @head.nil? 
      @head = new_node
      return
    end

    current = @head

    while current.next_node
      current = current.next_node
    end

    current.next_node = new_node
  end

  def print_list
    current = @head

    while current
      print "#{current.data} -> "
      current = current.next_node
    end

    puts " nil"
  end

  def prepend(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
      return
    end

    new_node.next_node = @head
    @head = new_node
  end

  def size
    if @head.nil?
      puts "Linked_list is empty"
      return
    end

    count = 0
    current = @head

    while current
      count += 1
      current = current.next_node
    end
    puts "Returning total number of nodes:#{count}"
    count
  end

  def head
    return nil if @head.nil?

    puts "Returning value of head: #{@head.data}"
    @head.data
  end

  def tail
    return nil if @head.nil?

    current = @head

    while current
      if current.next_node.nil?
        puts "Returning Value of tail #{current.data}"
        return current.data
      end
      current = current.next_node
    end
  end

  def at(index)
    return nil if @head.nil?

    current = @head
    count = 0

    while current
      count += 1
      if count == index
        puts "Returning value at index #{index}: #{current.data}"
        return current.data
      end

      current = current.next_node
    end
    puts "Returning nil, index #{index} does not exist. List only has #{count} nodes"
    nil
  end

  def pop 
    new_node = Node.new("O")
    return nil if @head.nil?
    
    head_value = @head.data
    new_node.next_node = @head
    second_node = @head.next_node
    @head = second_node
    
    puts "Removing and returning head: #{head_value}"
    @head
  end

  def index(value)
    return nil if @head.nil?

    current = @head
    count = 0

    while current
      count += 1
      if current.data == value
        puts "Returning value #{value} at index: #{count}"
        return count
      end
      current = current.next_node
    end
    puts "Returning nil since list does not contain #{value}"
    nil
  end

  def insert_at(index, *values)

    # create nodes using *values array and store them in nodes
    nodes = []
    values.each { |value| nodes << Node.new(value)  }

    # if values array is empty, there is nothing to insert
    return self if nodes.empty?

    # First, chain the new nodes together sequentially
    # Start tracking pointer a the first node object.
    current = nodes.first

    nodes[1..-1].each do |next_node|
      current.next_node = next_node # link them together
      current = next_node           # Move the tracking pointer forward
    end

    # Count list size to validate the index
    current = @head
    count = 0
    while current
      count += 1
      current = current.next_node
    end

    if !index.between?(0, count) || !index.is_a?(Integer) 
      raise IndexError.new("The index #{index} is invalid!")
    end

    if index == 0
      nodes.last.next_node = @head
      @head = nodes.first
      return self # to avoid running the middle-traversal loop below 
      # which would corrupt the list pointers.
    end

    # Traverse to the node right BEFORE the insertion index
    current = @head
    current_index = 0

    while current.next_node && current_index < index - 1
      current_index += 1
      current = current.next_node
    end

    # Stitch the new chain into the list
    nodes.last.next_node = current.next_node
    current.next_node = nodes.first

    self
  end

  def remove_at(index)

    if index == 0
      next_node = @head.next_node
      @head = next_node
    end

    # Count list size to validate the index
    current = @head
    length = 0

    while current
      length += 1
      current = current.next_node
    end

    # Add guard rails against out of bounds index
    if (index < 0 && index <= length) || (!index.is_a?(Integer))
      raise IndexError.new("Index #{index} is Invalid!")
    end
    
    # Traverse to the node right BEFORE the deletion index
    current = @head
    current_index = 0

    while current.next_node && current_index < index - 1
      current_index += 1
      current = current.next_node
    end

    # Sip over the over the target
    puts "Removing node at index #{index}"
    current.next_node = current.next_node.next_node
    
    self
  end
end