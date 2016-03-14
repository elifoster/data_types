require 'test/unit'
require_relative '../lib/data_types/triplet'

class TripletTestCases < Test::Unit::TestCase
  def test_string
    triplet = Triplet.new(1, 2, 3)
    assert_equal('1, 2, 3', triplet.to_s)
  end

  def test_array
    triplet = Triplet.new(1, 2, 3)
    assert_equal([1, 2, 3], triplet.to_a)
  end

  def test_hash
    triplet = Triplet.new(1, 2, 3)
    assert_equal({ left: 1, middle: 2, right: 3 }, triplet.to_h)
  end

  def test_include?
    triplet = Triplet.new(1, 2, 3)
    assert_equal(true, triplet.include?(1))
    assert_equal(true, triplet.include?(2))
    assert_equal(true, triplet.include?(3))
    assert_equal(false, triplet.include?(4))
  end

  def test_flip
    triplet = Triplet.new(1, 2, 3)
    assert_equal(1, triplet.flip.right)
    assert_equal(2, triplet.flip.middle)
    assert_equal(3, triplet.flip.left)
  end

  def test_flip!
    triplet = Triplet.new(1, 2, 3)
    triplet.flip!
    assert_equal(1, triplet.right)
    assert_equal(2, triplet.middle)
    assert_equal(3, triplet.left)
  end

  def test_empty?
    triplet = Triplet.new(1, 2, 3)
    assert_equal(false, triplet.empty?)
    triplet.clear
    assert_equal(true, triplet.empty?)
  end

  def test_clear
    triplet = Triplet.new(1, 2, 3)
    triplet.clear
    assert_nil(triplet.left)
    assert_nil(triplet.middle)
    assert_nil(triplet.right)
  end


  def test_equivalence
    triplet = Triplet.new(1, 2, 3)
    triplet1 = Triplet.new(1, 2, 3)
    triplet2 = Triplet.new(2, 1, 0)
    triplet3 = Triplet.new(1, 3, 2)
    triplet4 = Triplet.new(5, 2, 1)

    assert_equal(triplet, triplet1)
    assert_not_equal(triplet, triplet2)
    assert_not_equal(triplet, triplet3)
    assert_not_equal(triplet, triplet4)
  end

  def test_freeze
    triplet = Triplet.new(1, 2, 3).freeze
    assert_equal(true, triplet.frozen?)
    assert_equal(false, Triplet.new(2, 3, 4).frozen?)
    assert_raise RuntimeError do
      triplet.right += 1
    end
    assert_raise RuntimeError do
      triplet.right = 3
    end
    assert_raise RuntimeError do
      triplet.left += 1
    end
    assert_raise RuntimeError do
      triplet.left = 5
    end
    assert_raise RuntimeError do
      triplet.middle += 1
    end
    assert_raise RuntimeError do
      triplet.middle = 5
    end
    assert_nothing_raised do
      triplet = Triplet.new('a', 'b', 'c')
    end
  end

  def clone
    # Note that behavior is default different for integers (immutable) and Strings (mutable).
    triplet = Triplet.new(1, 2, 3)
    copy = triplet.clone
    assert_equal(triplet, copy)
    triplet.left = 5
    assert_not_equal(triplet, copy)
    assert_equal(triplet.right, copy.right)
    assert_not_equal(triplet.left, copy.left)
    assert_equal(triplet.middle, copy.middle)

    # String behavior
    triplet = Triplet.new('a', 'b', 'c')
    copy = triplet.clone
    assert_equal(triplet, copy)
    copy.left << 'c'
    assert_not_equal(triplet, copy)
    assert_equal(triplet.right, copy.right)
    assert_not_equal(triplet.left, copy.left)
    assert_equal(triplet.middle, copy.middle)
  end
end
