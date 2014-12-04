require 'spec_helper'

describe 'Generate Pairs' do
	let(:generator){PairGenerator::PossiblePairGenerator}
	let(:remover){PairGenerator::InvalidPairRemover}
	let(:selector){PairGenerator::PairSelector}

	before { @permutations = []}
	before { @valid_pairs = []}
	before { @selected = []}

	before { allow(generator).to receive(:get_pairs_from).and_return(@permutations)}
	before { allow(remover).to receive(:get_valid_pairs).and_return(@valid_pairs)}
	before { allow(selector).to receive(:get_pairs).and_return(@selected)}

	before { @pair_generator = PairGenerator::Generator.new(generator,remover,selector)}
	it 'should generate all possible permutations' do
		previous = []
		@pair_generator.generate_pairs(previous)
		expect(generator).to have_received(:get_pairs_from).with(previous)
	end

	it 'should remove invalid pairs' do
		@pair_generator.generate_pairs([])
		expect(remover).to have_received(:get_valid_pairs).with(@permutations)
	end

	it 'should select pairs' do
		@pair_generator.generate_pairs([])
		expect(selector).to have_received(:get_pairs).with(@valid_pairs)
	end

	it 'should return generated pairs' do 
		actual = @pair_generator.generate_pairs([])
		actual.should be @selected
	end

end

