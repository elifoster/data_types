# Triplet class represents a set of 3 pieces of data. The attributes are readers for custom = behavior.
class Triplet
  # @return [Object] The first data piece.
  attr_reader :left

  # @return [Object] The second data piece.
  attr_reader :middle

  # @return [Object] The third data piece.
  attr_reader :right

  # Creates a new Triplet.
  # @param left [Object] The first data.
  # @param middle [Object] The middle data.
  # @param right [Object] The last data.
  # @return [Triplet<Object, Object, Object>] The new Triplet.
  def initialize(left, middle, right)
    @left = left
    @middle = middle
    @right = right
    @frozen = false
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
  def flip!
    left = @left
    right = @right
    @right = left
    @left = right
  end

  # Returns true if self and other have the same left, middle, and right values.
  # @param other [Triplet] The other Triplet
  # @return [Boolean] Whether they are equivalent.
  def eql?(other)
    @left == other.left && @middle == other.middle && @right == other.right
  end

  alias == eql?

  # Returns whether self is frozen.
  # @return [Boolean] Whether self is frozen.
  def frozen?
    @frozen
  end

  # Deep-freezes the Triplet, freezing left, middle, and right, as well as the object itself.
  # @return [Triplet] self.
  def freeze
    unless frozen?
      @left.freeze
      @middle.freeze
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
      raise RuntimeError.new("can't modify frozen Triplet")
    else
      @right = new
    end
  end

  # Sets middle to the value.
  # @raise RuntimeError when self is frozen.
  # @param new [Any] The new middle value.
  # @return [void]
  def middle=(new)
    if frozen?
      raise RuntimeError.new("can't modify frozen Triplet")
    else
      @middle = new
    end
  end

  # Sets left to the value.
  # @raise RuntimeError when self is frozen.
  # @param new [Any] The new left value.
  # @return [void]
  def left=(new)
    if frozen?
      raise RuntimeError.new("can't modify frozen Triplet")
    else
      @left = new
    end
  end

  # Returns a new copied version of the Triplet, with copied values.
  # @return [Triplet] The new Triplet
  def clone
    Triplet.new(@left.dup, @middle.dup, @right.dup)
  end
end
