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
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

@parent_node = nil
@target_node = nil

def depth_search(node, target)
  node.payload == target ? 
  "The first node contains the value you are looking for. It is the node #{node}."
  : nil

  if node.children
    node.children.each do |child| 
      if child.payload == target
        @parent_node = node.payload
        @target_node = child
      else  
        depth_search(child, target)
      end
    end
  end

  @parent_node ? 
  "The value #{target} can be found at the node #{@target_node}. The parent node contains the value #{@parent_node}."
  : 'Not found.'
end

puts breadth_first(trunk, 11)
puts "----------"
puts breadth_first(trunk, 2)
puts "----------"
puts breadth_first(trunk, 12)