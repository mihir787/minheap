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

class NodeCollection
  attr_reader :original

  def initialize(input)
    @original = initialize_nodes(input)
  end

  def initialize_nodes(input)
    input.map {|v| Node.new(v)}
  end

  def min_node(node_collection)
    node_collection.min_by { |n| n.value }
  end

  def min_node_index(node_collection)
     min_node = min_node(node_collection)
     node_collection.find_index { |n| n == min_node }
  end

  def right_collection(node_collection)
    node_collection[(min_node_index(node_collection)) + 1..(node_collection.length - 1)]
  end

  def left_collection(node_collection)
    node_collection[0...min_node_index(node_collection)]
  end
end

class BinaryMinHeap
  attr_reader :root

  def initialize(input)
    @original_input = input
    @node_collection = NodeCollection.new(input)
  end

  def set
    original = node_collection.original
    left = node_collection.left_collection(original)
    puts "Left #{left}"
    right = node_collection.right_collection(original)
    puts "Right #{right}"

    #set_root_node
    parent_node = node_collection.min_node(original)
    @root = parent_node unless root

    #set_left_node
    parent_node.left_node = node_collection.min_node(left)

    #set_right_node
    parent_node.right_node = node_collection.min_node(right)
  end

  private

  attr_reader :original_input, :node_collection
end
