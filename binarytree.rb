class BinaryTree

  class Node
    attr_reader :key, :left, :right, :depth

    def initialize(key,depth = 0)
      @key = key
      @left = nil
      @right = nil
      @depth = depth
    end

    def insert( new_key, depth = 0)
      if new_key <= @key
        @left.nil? ? @left = Node.new(new_key, depth + 1 ) : @left.insert(new_key, depth + 1 )
        ##raise "profundidad: " + depth.to_s + " llave: " +  new_key.to_s
      elsif new_key > @key
        @right.nil? ? @right = Node.new(new_key, depth + 1 ) : @right.insert(new_key, depth + 1)
      end
    end

  end

  def initialize
    @root = nil
  end

  def insert( key, depth = 0 )
    if @root.nil?
      @root = Node.new( key )
    else
      @root.insert( key, depth )
    end
  end

  def in_order(node=@root, &block)
    return if node.nil?
    in_order(node.left, &block)
    yield node
    in_order(node.right, &block)
  end

  def pre_order(node=@root, &block)
    return if node.nil?
    yield node
    in_order(node.left, &block)
    in_order(node.right, &block)
  end

  def post_order(node=@root, &block)
    return if node.nil?
    in_order(node.left, &block)
    in_order(node.right, &block)
    yield node
  end

  def search( key, node=@root )
    return nil if node.nil?
    if key < node.key
      search( key, node.left )
    elsif key > node.key
      search( key, node.right )
    else
      return node
    end
  end

end
