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
end
