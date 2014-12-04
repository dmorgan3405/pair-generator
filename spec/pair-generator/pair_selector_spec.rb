require 'spec_helper'

describe PairGenerator::PairSelector do

	before { @selector = PairGenerator::PairSelector.new}

	it 'should return empty array when no possible pairs provided' do
		actual = @selector.get_pairs([])
		actual.should == []
	end

	it 'should return single pair when given one pair' do
		expected = ["GuyOne", "GirlTwo"]
		actual = @selector.get_pairs(expected.permutation(2).to_a)
		actual.first.should =~ expected
	end

	it 'should include each person in a pair' do
		expected = ["GuyOne", "GirlTwo", "ZombieThree", "GhostFour"]
		actual = @selector.get_pairs(expected.permutation(2).to_a)
		actual.flatten.should =~ expected
	end
end