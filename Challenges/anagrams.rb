=begin
Given a word and a list of words in array form, return a list containing only the anagrams of the word
Words that are the same are not anagrams, and the anagrams are case insensitive

Algorithm:
Write a method that cycles through the words in the provided list and passes them to a 
submethod that checks if each word is an anagram of the provided word. If it is, add it
to the result array
The submethod should do the following:
  Store the input word all lowercase
  Store the comparison word all lowercase
  if the input word == the comparison word, return false
  Pass each word to another submethod, which returns a hash containing the letters and letter
  count of each word.
  If the hashes are ==, return true.
=end

class Anagram
  attr_accessor :word

  def initialize(word)
    @word = word
  end

  def letters_hash(string)
    string.each_char.with_object(Hash.new(0)) do |char, hash|
      hash[char] += 1
    end
  end

  def is_anagram?(compare)
    ref = word.downcase
    other_word = compare.downcase
    return false if ref == other_word
    letters_hash(ref) == letters_hash(other_word)
  end

  def match(list)
    list.each_with_object([]) do |comp, array|
      array << comp if is_anagram?(comp)
    end
  end
end
