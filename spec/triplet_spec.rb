require_relative 'spec_helper'

describe Triplet do
  describe '#to_s' do
    it 'returns a string representation' do
      expect(Triplet.new(1, 2, 3).to_s).to eq '1, 2, 3'
    end

    describe '#to_a' do
      it 'returns an array representation' do
        expect(Triplet.new(1, 2, 3).to_a).to eq [1, 2, 3]
      end
    end

    describe '#to_h' do
      it 'returns a hash representation' do
        expect(Triplet.new(1, 2, 3).to_h).to eq({ left: 1, middle: 2, right: 3 })
      end
    end

    describe '#include?' do
      it 'checks if the value is present in the triplet' do
        triplet = Triplet.new(1, 2, 3)
        expect(triplet.include?(1)).to be true
        expect(triplet.include?(2)).to be true
        expect(triplet.include?(3)).to be true
        expect(triplet.include?(4)).to be false
      end
    end

    describe '#flip' do
      it 'returns a new triplet with the order of values reversed' do
        triplet = Triplet.new(1, 2, 3)
        expect(triplet.flip.right).to eq 1
        expect(triplet.flip.middle).to eq 2
        expect(triplet.flip.left).to eq 3
      end
    end

    describe '#flip!' do
      it 'reverses the order of values in the triplet' do
        triplet = Triplet.new(1, 2, 3)
        triplet.flip!
        expect(triplet.right).to eq 1
        expect(triplet.middle).to eq 2
        expect(triplet.left).to eq 3
      end
    end

    describe '#empty?' do
      it 'checks if the triplet only contains nil' do
        triplet = Triplet.new(1, 2, 3)
        expect(triplet.empty?).to be false
        triplet.clear
        expect(triplet.empty?).to be true
      end
    end

    describe 'equality' do
      it 'checks that two triplets of the same values are equal' do
        triplet = Triplet.new(1, 2, 3)
        expect(triplet).to eq Triplet.new(1, 2, 3)
        expect(triplet).not_to eq Triplet.new(2, 1, 0)
        expect(triplet).not_to eq Triplet.new(1, 3, 2)
        expect(triplet).not_to eq Triplet.new(5, 2, 1)
      end
    end

    describe '#freeze and #frozen?' do
      it 'prevents the triplet from being modified' do
        triplet = Triplet.new(1, 2, 3)
        expect(triplet.frozen?).to be false
        triplet.freeze
        expect(triplet.frozen?).to be true
        expect { triplet.right += 1 }.to raise_error(RuntimeError)
        expect { triplet.right = 3 }.to raise_error(RuntimeError)
        expect { triplet.left += 1 }.to raise_error(RuntimeError)
        expect { triplet.left = 3 }.to raise_error(RuntimeError)
        expect { triplet.middle += 1 }.to raise_error(RuntimeError)
        expect { triplet.middle = 3 }.to raise_error(RuntimeError)
        expect { triplet = Triplet.new('a', 'b', 'c') }.not_to raise_error
      end
    end

    describe '#clone' do
      it 'copies the triplet values into a new triplet' do
        # Behavior is different for mutable and immutable values
        # Immutable behavior
        triplet = Triplet.new(1, 2, 3)
        copy = triplet.clone
        expect(triplet).to eq copy
        triplet.left = 5
        expect(triplet).not_to eq copy
        expect(triplet.right).to eq copy.right
        expect(triplet.middle).to eq copy.middle
        expect(triplet.left).not_to eq copy.left

        # Mutable behavior
        triplet = Triplet.new('a', 'b', 'c')
        copy = triplet.clone
        expect(triplet).to eq copy
        copy.left << 'c'
        expect(triplet).not_to eq copy
        expect(triplet.right).to eq copy.right
        expect(triplet.middle).to eq copy.middle
        expect(triplet.left).not_to eq copy.left
      end
    end
  end
end
