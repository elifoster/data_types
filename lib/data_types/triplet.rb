# Triplet class represents a set of 3 pieces of data.
class Triplet
  # @return [Object] The first data piece.
  attr_accessor :left

  # @return [Object] The second data piece.
  attr_accessor :middle

  # @return [Object] The third data piece.
  attr_accessor :right

  # Creates a new Triplet.
  # @param left [Object] The first data.
  # @param middle [Object] The middle data.
  # @param right [Object] The last data.
  # @return [Triplet<Object, Object, Object>] The new Triplet.
  def initialize(left, middle, right)
    @left = left
    @middle = middle
    @right = right
  end

  # @return [String] The stringified version of the Triplet.
  def to_s
    "#{@left}, #{@middle}, #{@right}"
  end

  # Removes all of the values in the triplet.
  # @return [void]
  def clear
    remove_instance_variable(:@left)
    remove_instance_variable(:@middle)
    remove_instance_variable(:@right)
  end

  # Gets the Triplet as an array.
  # @return [Array<Object>] The array with the triplet pieces.
  def to_a
    [@left, @middle, @right]
  end

  # Gets the Triplet as a hash with left, middle, and right keys.
  # @return [Hash<Symbol, Object>] The hash with the triplet pieces.
  def to_h
    {
      left: @left,
      middle: @middle,
      right: @right
    }
  end

  # Returns true if the given object is present in self.
  # @param data [Object]
  # @return [Boolean]
  def include?(data)
    @left == data || @middle == data || @right == data
  end

  # Gets whether the triplet is empty.
  # @return [Boolean] True if all values are nil.
  def empty?
    @left.nil? && @middle.nil? && @right.nil?
  end

  # Flips the Triplet into a new Triplet.
  # @return [Triplet] The new triplet with the flipped data.
  def flip
    Triplet.new(@right, @middle, @left)
  end

  # Flips the triplet in place.
  # @return [Triplet] The Triplet with the left and right values flipped.
  def flip!
    left = @left
    right = @right
    @right = left
    @left = right
    self
  end
end
