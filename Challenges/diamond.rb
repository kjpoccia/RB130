class Diamond
  def self.make_diamond(letter)
    letter_array = letters(letter)
    width = calculate_width(letter)
    diamond = ""
    letter_array.each do |letter|
      diamond << row(letter).center(width) << "\n"
    end
    diamond
  end

  class << self
    private

    def letters(letter)
      letter_array = ("A"..letter).to_a + ("A"..letter).to_a.reverse
      letter_array.delete_at(letter_array.index(letter))
      letter_array
    end

    def calculate_width(letter)
      ("A"..letter).to_a.size * 2 - 1
    end

    def row(letter)
      if letter == "A"
        letter
      else
        letter + " " * spaces(letter) + letter
      end
    end

    def spaces(letter)
      (letter.ord - 65) * 2 - 1
    end
  end
end

puts Diamond.make_diamond("C")