require 'spec_helper'

describe 'Possible Pair Generator'  do
	
	it 'generates all permuations for 3 names' do
		generator = PairGenerator::PossiblePairGenerator.new
		list_of_pairs = generator.get_pairs_from(["Foo", "Bar", "Moo"]) 
		list_of_pairs.should =~ [["Foo", "Bar"], ["Foo", "Moo"], ["Bar","Moo"], ["Bar", "Foo"],["Moo", "Foo"], ["Moo", "Bar"]]
	end
end