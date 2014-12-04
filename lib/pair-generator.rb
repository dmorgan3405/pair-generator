require 'pair-generator/invalid_pair_remover'
require 'pair-generator/possible_pair_generator'
require 'pair-generator/pair_selector'


module PairGenerator
	attr_accessor :previous_pairs

	class Generator

		def initialize(generator, remover, selector)
			@generator = generator
			@remover = remover
			@selector = selector
		end

		def generate_pairs(previous_pairs)
			possibilities = @generator.get_pairs_from(previous_pairs)
			valid_pairs = @remover.get_valid_pairs(possibilities)
			@selector.get_pairs(valid_pairs)
		end
	end

end