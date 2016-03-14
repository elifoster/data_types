# The Pair class represents a pair of two pieces of data. The attributes are readers for custom = behavior.
class Pair
  # @return [Object] The left data.
  attr_reader :left

  # @return [Object] The right data.
  attr_reader :right

  # Creates a new pair.
  # @param left [Object] The left piece of data.
  # @param right [Object] The right piece of data.
  # @return [Pair<Object, Object>] The new pair created with these pieces of
  #   data.
  def initialize(left, right)
    @left = left
    @right = right
    @frozen = false
  end

  # Gets a string representation of the pair.
  # @return [String] The stringified version of the pair.
  def to_s
    "#{@left}, #{@right}"
  end

  # Removes all of the values in the pair..
  # @return [void]
  def clear
    remove_instance_variable(:@left)
    remove_instance_variable(:@right)
  end

  # Gets the Pair as an array.
  # @return [Array<Object>] The array with the pair pieces.
  def to_a
    [@left, @right]
  end

  # Gets the Pair as a hash with left and right keys.
  # @return [Hash<Symbol, Object>] The hash with the pair pieces.
  def to_h
    {
      left: @left,
      right: @right
    }
  end

  # Returns true if the given object is present in self.
  # @param data [Object]
  # @return [Boolean]
  def include?(data)
    @left == data || @right == data
  end

  # Gets whether the pair is empty.
  # @return [Boolean] True if all values are nil.
  def empty?
    @left.nil? && @right.nil?
  end

  # Flips the pair.
  # @return [Pair] A new pair with the left and right values flipped.
  def flip
    Pair.new(@right, @left)
  end

  # Flips the pair in place.
  # @return [Pair] Returns self.
  def flip!
    right = @right
    left = @left
    @left = right
    @right = left
    self
  end

  # Returns true if self and other have the same left and right values.
  # @param other [Pair] The other Pair
  # @return [Boolean] Whether they are equivalent.
  def eql?(other)
    @left == other.left && @right == other.right
  end

  alias == eql?

  # Returns whether self is frozen.
  # @return [Boolean] Whether self is frozen.
  def frozen?
    @frozen
  end

  # Deep-freezes the Pair, freezing left and right, as well as the object itself.
  # @return [Pair] self.
  def freeze
    unless frozen?
      @left.freeze
      @right.freeze
      @frozen = true
    end
    self
  end

  # Sets right to the value.
  # @raise RuntimeError when self is frozen.
  # @param new [Any] The new right value.
  # @return [void]
  def right=(new)
    if frozen?
      raise RuntimeError.new("can't modify frozen Pair")
    else
      @right = new
    end
  end

  # Sets left to the value.
  # @raise RuntimeError when self is frozen.
  # @param new [Any] The new left value.
  # @return [void]
  def left=(new)
    if frozen?
      raise RuntimeError.new("can't modify frozen Pair")
    else
      @left = new
    end
  end

  # Returns a new copied version of the Pair, with copied values.
  # @return [Pair] The new Pair
  def clone
    Pair.new(@left.dup, @right.dup)
  end
end
