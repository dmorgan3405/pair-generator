module PairGenerator
	class PairSelector
		def get_pairs(possibilities)
			return [] if possibilities.empty?

			selected_pairs = []
			for i in 1..(possibilities.flatten.uniq.count/2)
				picked = possibilities.shuffle.first
				selected_pairs.push(picked)
				possibilities.delete_if{|c| c.include?(picked.first) || c.include?(picked.last) }
			end
			selected_pairs
		end
	end
end