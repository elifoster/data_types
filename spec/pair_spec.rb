require_relative 'spec_helper'

describe Pair do
  describe '#to_s' do
    it 'returns a string representation' do
      expect(Pair.new(1, 2).to_s).to eq '1, 2'
    end
  end

  describe '#to_a' do
    it 'returns an array representation' do
      expect(Pair.new(1, 2).to_a).to eq [1, 2]
    end
  end

  describe '#to_h' do
    it 'returns a hash representation' do
      expect(Pair.new(1, 2).to_h).to eq({ left: 1, right: 2 })
    end
  end

  describe '#include?' do
    it 'checks if the pair includes a value on either side' do
      pair = Pair.new(1, 2)
      expect(pair.include?(1)).to be true
      expect(pair.include?(2)).to be true
      expect(pair.include?(3)).to be false
    end
  end

  describe '#flip' do
    it 'returns a new pair with the values reversed' do
      pair = Pair.new(1, 2)
      expect(pair.flip.right).to eq 1
      expect(pair.flip.left).to eq 2
    end
  end

  describe '#flip!' do
    it "reverses the pair's values in place" do
      pair = Pair.new(1, 2)
      pair.flip!
      expect(pair.right).to eq 1
      expect(pair.left).to eq 2
    end
  end

  describe '#empty?' do
    it 'checks if the pair only has nil values' do
      pair = Pair.new(1, 2)
      expect(pair.empty?).to be false
      pair.clear
      expect(pair.empty?).to be true
    end
  end

  describe '#clear' do
    it 'sets the values to nil' do
      pair = Pair.new(1, 2)
      pair.clear
      expect(pair.left).to be_nil
      expect(pair.right).to be_nil
    end
  end

  describe 'equality' do
    it 'checks that two pairs of the same values are equal' do
      base_pair = Pair.new(1, 2)
      expect(base_pair).to eq Pair.new(1, 2)
      expect(base_pair).not_to eq Pair.new(2, 1)
      expect(base_pair).not_to eq Pair.new(1, 3)
      expect(base_pair).not_to eq Pair.new(5, 2)
    end
  end

  describe '#clone' do
    it 'clones the pair into a new object' do
      # There is different behavior for immutable and mutable objects.

      # Immutable behavior
      pair = Pair.new(1, 2)
      copy = pair.clone
      expect(pair).to eq copy
      pair.left = 5
      expect(pair).not_to eq copy
      expect(pair.right).to eq copy.right
      expect(pair.left).not_to eq copy.left

      # Mutable behavior
      pair = Pair.new('a', 'b')
      copy = pair.clone
      expect(pair).to eq copy
      copy.left << 'c'
      expect(pair).not_to eq copy
      expect(pair.right).to eq copy.right
      expect(pair.left).not_to eq copy.left
    end
  end

  describe '#freeze and #frozen?' do
    it 'prevents the pair from being modified' do
      pair = Pair.new(1, 2)
      expect(pair.frozen?).to be false
      pair.freeze
      expect(pair.frozen?).to be true

      expect { pair.right += 1 }.to raise_error(RuntimeError)
      expect { pair.left += 1 }.to raise_error(RuntimeError)
      expect { pair.right = 5 }.to raise_error(RuntimeError)
      expect { pair.left = 5 }.to raise_error(RuntimeError)

      expect(pair.right).to eq 2
      expect(pair.left).to eq 1

      expect { pair = Pair.new('a', 'b') }.not_to raise_error
      expect(pair.right).to eq 'b'
      expect(pair.left).to eq 'a'
    end
  end
end
