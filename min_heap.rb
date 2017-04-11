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
    @node_collection = NodeCollection.new(input)
  end

  def set(node_collection_set: node_collection.original)
    left = node_collection.left_collection(node_collection_set)
    right = node_collection.right_collection(node_collection_set)

    parent_node = node_collection.min_node(node_collection_set)
    @root = parent_node unless root

    unless left.empty?
      left_min_node = node_collection.min_node(left)
      parent_node.left_node = left_min_node
      left_min_node.parent_node = parent_node
      set(node_collection_set: left)
    end

    unless right.empty?
      right_min_node = node_collection.min_node(right)
      parent_node.right_node = right_min_node
      right_min_node.parent_node = parent_node
      set(node_collection_set: right)
    end
  end

  private

  attr_reader :node_collection
end
