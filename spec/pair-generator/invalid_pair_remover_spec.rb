require 'spec_helper'

describe PairGenerator::InvalidPairRemover do
	it 'Removes yesterdays pairs' do
		remover = PairGenerator::InvalidPairRemover.new
		result_pairs = remover.get_valid_pairs([["Moo","Bar"], ["Foo", "Moo"], ["Bar", "Foo"]], [["Foo","Moo"]])
		result_pairs.should =~ [["Moo","Bar"], ["Bar", "Foo"]]
	end

	it 'Removes each permutation of yesterdays pairs' do
		remover = PairGenerator::InvalidPairRemover.new
		result_pairs = remover.get_valid_pairs([["Moo","Bar"], ["Foo", "Moo"], ["Bar", "Foo"], ["Moo", "Foo"]], [["Foo","Moo"]])
		result_pairs.should =~ [["Moo","Bar"], ["Bar", "Foo"]]
	end

	it 'Does not allow those dudes Adrian and Doug to pair together' do
		remover = PairGenerator::InvalidPairRemover.new
		resulting_pairs = remover.get_valid_pairs([["Dude1","Doug"],["Adrian", "Dude2"],["Doug","Adrian"],["Adrian","Doug"]],[["Dude3","Dude4"]])
		resulting_pairs.should =~ [["Dude1","Doug"],["Adrian", "Dude2"]]
	end
end
