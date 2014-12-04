module PairGenerator
	class PossiblePairGenerator 

		def get_pairs_from(previous_day)
			return previous_day.flatten.permutation(2).to_a
		end
		
	end
end