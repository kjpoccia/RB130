require 'pry-byebug'

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    distance = 0
    stop_at = [strand.size, other_strand.size].min
    strand.chars.each_with_index do |char, idx|
      break if idx == stop_at
      distance += 1 if char != other_strand.chars[idx]
    end
    distance
  end
end
