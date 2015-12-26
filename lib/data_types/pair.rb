# The Pair class represents a pair of two pieces of data.
class Pair
  # @return [Object] The left data.
  attr_accessor :left

  # @return [Object] The right data.
  attr_accessor :right

  # Creates a new pair.
  # @param left [Object] The left piece of data.
  # @param right [Object] The right piece of data.
  # @return [Pair<Object, Object>] The new pair created with these pieces of
  #   data.
  def initialize(left, right)
    @left = left
    @right = right
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
end
