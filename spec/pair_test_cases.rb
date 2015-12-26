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
end
