=begin
Given a word, calculate the scrabble score

Create a reference hash to store the scores
Write a method to cycle through the word and sum up the points for each letter

=end
 
class Scrabble
  POINTS = {%w(A E I O U L N R S T) => 1, %w(D G) => 2, %w(B C M P) => 3, %w(F H V W Y) => 4,
            %w(K) => 5, %w(J X) => 8, %w(Q Z) => 10}

  def initialize(word)
    @word = word
  end

  def score_letter(letter)
    POINTS.each do |key, value|
      return value if key.include?(letter.upcase)
    end
    0
  end

  def score
    return 0 if @word.nil?
    @word.each_char.map { |char| score_letter(char) }.sum
  end

  def self.score(new_word)
    Scrabble.new(new_word).score
  end
end
