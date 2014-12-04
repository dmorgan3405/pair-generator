module PairGenerator
	class InvalidPairRemover
		def get_valid_pairs(all_pairs, yesterdays_pairs)
			pairs_to_remove = yesterdays_pairs + yesterdays_pairs.map(&:reverse)
			pairs_to_remove.push(["Doug", "Adrian"])
			pairs_to_remove.push(["Adrian", "Doug"])
			return all_pairs - pairs_to_remove
		end
	end
end
