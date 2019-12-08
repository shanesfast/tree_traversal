class MyQueue
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
end

class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end
end

# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk = Tree.new(2, [seventh_node, shallow_fifth_node])

@queue = MyQueue.new

def build_queue(node)
  if node.children
    node.children.each do |child|
      @queue.enqueue(child)
    end
  end
end

def breadth_first(node, target)
  if node.payload == target 
    return "The first node contains the value you are looking for. It is node #{node}"
  end

  target_node = nil
  build_queue(node)

  while @queue.queue.length >= 1
    head = @queue.queue[0]
    if head
      head.payload == target ? target_node = head : nil
      build_queue(head)
    end
    @queue.dequeue
  end

  target_node ? "The value #{target} can be found at the node #{target_node}."
  : "Not found."
end

puts breadth_first(trunk, 11)
puts "----------"
puts breadth_first(trunk, 2)
puts "----------"
puts breadth_first(trunk, 12)
