
require './binarytree'

tree = BinaryTree.new

tree.insert(50)
tree.insert(60)
tree.insert(25)
tree.insert(75)
tree.insert(12)
tree.insert(37)
tree.insert(87)
tree.insert(63)

puts tree.inspect

puts "pre_order"
tree.pre_order do |node|
  puts node.key
end

puts "in_order"
tree.in_order do |node|
  puts node.key
end

puts "post_order"
tree.post_order do |node|
  puts node.key
end

node = tree.search(37)

puts "busqueda: " + node.key.to_s + " profundida: " + node.depth.to_s
