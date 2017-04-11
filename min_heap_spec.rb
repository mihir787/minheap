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

describe BinaryMinHeap do
  context 'simplest cases' do
    # it '[12, 31, 4]' do
    #   input = [12, 31, 4]
    #
    #   bh = BinaryMinHeap.new(input)
    #
    #   bh.set
    #   root = bh.root
    #
    #   expect(root).to eq(4)
    #   expect(root.left.value).to eq(12)
    #   expect(root.left.right.value).to eq(31)
    # end

    it '[12, 4, 31]' do
        input = [12, 4, 31]

        bh = BinaryMinHeap.new(input)

        bh.set
        root = bh.root

        expect(root.value).to eq(4)
        expect(root.left_node.value).to eq(12)
        expect(root.right_node.value).to eq(31)
    end
    #
    # it '[4, 12, 31]' do
    #
    # end
    #
    # it '[4, 31, 12]' do
    #
    # end
  end
end
