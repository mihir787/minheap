require 'rspec'
require_relative 'min_heap'

describe Node do
  it 'should have a value' do
    node = Node.new(33)

    expect(node.value).to eq 33
  end

  it 'should have a parent node if present' do
    parent_node = Node.new(21)
    node = Node.new(33, parent_node: parent_node)

    expect(node.parent_node).to eq parent_node
  end

  it 'should have a left node' do
    left_node = Node.new(21)
    node = Node.new(33, left_node: left_node)

    expect(node.left_node).to eq left_node
  end

  it 'should have a right node' do
    right_node = Node.new(21)
    node = Node.new(33, right_node: right_node)

    expect(node.right_node).to eq right_node
  end
end

describe NodeCollection do
  it 'should initialize an array of inputs in to a collection of nodes' do
    input = [12, 31, 17]

    collection = NodeCollection.new(input)

    expect(collection.original.map(&:value)).to eq([12, 31, 17])
  end

  it '#min_node' do
    input = [12, 31, 17]

    collection = NodeCollection.new(input)
    input = collection.original

    min_node = collection.min_node(input)

    expect(min_node.value).to eq(12)
  end

  it '#min_node_index' do
    input = [12, 31, 10]

    collection = NodeCollection.new(input)
    input = collection.original

    min_node_index = collection.min_node_index(input)

    expect(min_node_index).to eq(2)
  end

  it '#right_collection' do
    input = [12, 31, 10, 11, 91]

    collection = NodeCollection.new(input)
    input = collection.original

    right_collection = collection.right_collection(input)

    expect(right_collection.map(&:value)).to eq([11, 91])
  end

  it '#left_collection' do
    input = [12, 31, 10, 11, 91]

    collection = NodeCollection.new(input)
    input = collection.original

    left_collection = collection.left_collection(input)

    expect(left_collection.map(&:value)).to eq([12, 31])
  end
end

describe BinaryMinHeap do
  context '3 numbers' do
    it '[12, 31, 4]' do
      input = [12, 31, 4]

      bh = BinaryMinHeap.new(input)

      bh.set
      root = bh.root

      expect(root.value).to eq(4)
      expect(root.left_node.value).to eq(12)
      expect(root.left_node.right_node.value).to eq(31)
    end

    it '[12, 4, 31]' do
        input = [12, 4, 31]

        bh = BinaryMinHeap.new(input)

        bh.set
        root = bh.root

        expect(root.value).to eq(4)
        expect(root.left_node.value).to eq(12)
        expect(root.right_node.value).to eq(31)
    end

    it '[4, 12, 31]' do
      input = [4, 12, 31]

      bh = BinaryMinHeap.new(input)

      bh.set
      root = bh.root

      expect(root.value).to eq(4)
      expect(root.right_node.value).to eq(12)
      expect(root.right_node.right_node.value).to eq(31)
    end

    it '[4, 31, 12]' do
      input = [4, 31, 12]

      bh = BinaryMinHeap.new(input)

      bh.set
      root = bh.root

      expect(root.value).to eq(4)
      expect(root.right_node.value).to eq(12)
      expect(root.right_node.left_node.value).to eq(31)
    end
  end

  context '4 numbers' do
    it '[1, 5, 2, 4]' do
      input = [1, 5, 2, 4]

      bh = BinaryMinHeap.new(input)

      bh.set
      root = bh.root

      expect(root.value).to eq(1)
      expect(root.right_node.value).to eq(2)
      expect(root.right_node.left_node.value).to eq(5)
      expect(root.right_node.right_node.value).to eq(4)
    end
  end

  context '5 numbers' do
    it '[10, 2, 9, 7, 3]' do
      input = [10, 2, 9, 7, 3]

      bh = BinaryMinHeap.new(input)

      bh.set
      root = bh.root

      expect(root.value).to eq(2)
      expect(root.left_node.value).to eq(10)
      expect(root.right_node.value).to eq(3)
      expect(root.right_node.left_node.value).to eq(7)
      expect(root.right_node.left_node.left_node.value).to eq(9)
    end
  end
end
