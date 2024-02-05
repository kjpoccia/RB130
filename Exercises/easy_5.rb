
=begin
Problem:
- Decode each letter based on ROT13, return decoded string.

Algorithm:
- Submethod:
- If the letter is lowercase, add 13 to its ascii value. If that result is greater
than 122, add the difference between the result and 122 to 97. 
- If the letter is uppercase, add 13 to its ascii value. If that result is greater
than 90, add the difference between the result and 90 to 65.
- Main method:
- Iterate through the string, if it's a space, add it to the result string, if it's
lowercase, call the shifted lowercase method and add the result to the result string,
if it's uppercase, call the shifted uppercase method and add the result to the 
result string

=end

def shift_lowercase(letter)
  result = letter.ord + 13
  result = result - 122 + 96 if result > 122
  result.chr
end

def shift_uppercase(letter)
  result = letter.ord + 13
  result = result - 90 + 64 if result > 90
  result.chr
end


def decipher(string)
  string.each_char.with_object("") do |char, str|
    if !(('a'..'z').to_a + ('A'..'Z').to_a).include?(char)
      str << char
    elsif char.downcase == char
      str << shift_lowercase(char)
    elsif char.upcase == char
      str << shift_uppercase(char)
    end
  end
end

p decipher("Nqn Ybirynpr")
p decipher("Tenpr Ubccre")
p decipher("Nqryr Tbyqfgvar")
p decipher("Nyna Ghevat")
p decipher("Puneyrf Onoontr")
p decipher("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
p decipher("Wbua Ngnanfbss")
p decipher("Ybvf Unvog")
p decipher("Pynhqr Funaaba")
p decipher("Fgrir Wbof")
p decipher("Ovyy Tngrf")
p decipher("Gvz Orearef-Yrr")
p decipher("Fgrir Jbmavnx")
p decipher("Xbaenq Mhfr")
p decipher("Fve Nagbal Ubner")
p decipher("Zneiva Zvafxl")
p decipher("Lhxvuveb Zngfhzbgb")
p decipher("Unllvz Fybavzfxv")
p decipher("Tregehqr Oynapu")