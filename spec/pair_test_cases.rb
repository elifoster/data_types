require 'test/unit'
require_relative '../lib/data_types/pair'

class PairTestCases < Test::Unit::TestCase
  def test_string
    pair = Pair.new(1, 2)
    assert_equal('1, 2', pair.to_s)
  end

  def test_array
    pair = Pair.new(1, 2)
    assert_equal([1, 2], pair.to_a)
  end

  def test_hash
    pair = Pair.new(1, 2)
    assert_equal({ left: 1, right: 2 }, pair.to_h)
  end

  def test_include?
    pair = Pair.new(1, 2)
    assert_equal(true, pair.include?(1))
    assert_equal(true, pair.include?(2))
    assert_equal(false, pair.include?(3))
  end

  def test_flip
    pair = Pair.new(1, 2)
    assert_equal(1, pair.flip.right)
    assert_equal(2, pair.flip.left)
  end

  def test_flip!
    pair = Pair.new(1, 2)
    pair.flip!
    assert_equal(1, pair.right)
    assert_equal(2, pair.left)
  end

  def test_empty?
    pair = Pair.new(1, 2)
    assert_equal(false, pair.empty?)
    pair.clear
    assert_equal(true, pair.empty?)
  end

  def test_clear
    pair = Pair.new(1, 2)
    pair.clear
    assert_nil(pair.left)
    assert_nil(pair.right)
  end

  def test_equivalence
    pair = Pair.new(1, 2)
    pair1 = Pair.new(1, 2)
    pair2 = Pair.new(2, 1)
    pair3 = Pair.new(1, 3)
    pair4 = Pair.new(5, 2)

    assert_equal(pair, pair1)
    assert_not_equal(pair, pair2)
    assert_not_equal(pair, pair3)
    assert_not_equal(pair, pair4)
  end

  def test_freeze
    pair = Pair.new(1, 2).freeze
    assert_equal(true, pair.frozen?)
    assert_equal(false, Pair.new(2, 3).frozen?)
    assert_raise RuntimeError do
      pair.right += 1
    end
    assert_raise RuntimeError do
      pair.right = 3
    end
    assert_raise RuntimeError do
      pair.left += 1
    end
    assert_raise RuntimeError do
      pair.left = 5
    end
    assert_nothing_raised do
      pair = Pair.new('a', 'b')
    end
  end

  def clone
    # Note that behavior is default different for integers (immutable) and Strings (mutable).
    pair = Pair.new(1, 2)
    copy = pair.clone
    assert_equal(pair, copy)
    pair.left = 5
    assert_not_equal(pair, copy)
    assert_equal(pair.right, copy.right)
    assert_not_equal(pair.left, copy.left)

    # String behavior
    pair = Pair.new('a', 'b')
    copy = pair.clone
    assert_equal(pair, copy)
    copy.left << 'c'
    assert_not_equal(pair, copy)
    assert_equal(pair.right, copy.right)
    assert_not_equal(pair.left, copy.left)
  end
end
