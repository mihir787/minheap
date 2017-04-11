require 'byebug'

class Node
  attr_accessor :value, :parent_node, :left_node, :right_node

  def initialize(value, parent_node: nil, left_node: nil, right_node: nil)
    @value = value
    @parent_node = parent_node
    @left_node = left_node
    @right_node = right_node
  end
end

class BinaryMinHeap
  attr_reader :root

  def initialize(input)
    @original_input = input
  end

  def set
    left = left_input(original_input)
    puts "Left #{left}"
    right = right_input(original_input)
    puts "Right #{right}"

    #set_root_node
    parent_node = Node.new(min_value(original_input))
    @root = parent_node unless root

    #set_left_node
    parent_node.left_node = Node.new(min_value(left), parent_node: parent_node)

    #set_right_node
    parent_node.right_node = Node.new(min_value(right), parent_node: parent_node)
  end

  private

  attr_reader :original_input

  def left_input(input)
    input[0...input.index(min_value(input))]
  end

  def right_input(input)
    input[(input.index(min_value(input)) + 1)..(input.length - 1)]
  end

  def min_value(input)
    input.min
  end
end
