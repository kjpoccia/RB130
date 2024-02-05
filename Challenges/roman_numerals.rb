class RomanNumerals
end

=begin
We're given an integer, we need to turn it into a Roman Numeral
Get the number, turn it into its digits
Use sub methods for each position. For ones, do I * however many there are, then if there are
  5 Is in a row, replace with a V. For tens, do the same with X (and L). And for 100s do 
    the same with Cs (and D). For 1000s, we only go up to 3000. Correct the special numbers
1024
1000 - M
20 - XX
4 - IV
1, 2, 3 - increments of I
4 I less than V
5, 6, 7, 8 - V, plus increments of I
9, I less than X
10 - X
11, 12, 13 - X, plus increments of I
14 is 
I, II, III, IV, V, VI, VII, VIII, IX, X, XI, XII, XIII, XIV, XV, XVI, XVII, XVIII, XIX, XX
X
XX
XXX
XL
L
LX
LXX
LXXX
XC
C
CX
CXX
CXXX

Weird numbers: 4, 9, 40, 90, 400, 900

ONE_TO_NINE = %w(I II III IV V VI VII VIII IX)
VIIII

=end

class RomanNumeral
  attr_reader :digits
  attr_accessor :number

  ONE = "I"
  FIVE = "V"
  TEN = "X"
  FIFTY = "L"
  HUNDRED = "C"
  FIVE_HUNDRED = "D"
  THOUSAND = "M"

  def initialize(int)
    @integer = int
    @digits = int.digits
    @number = ''
  end

  def convert(place, single, five, ten)
    if digits[place] == 9
      return single + ten
    elsif digits[place] == 4
      return single + five
    elsif digits[place] > 4
      return five + single * (digits[place] - 5)
    else
      return single * digits[place]
    end
  end

  def convert_thousands
    return "M" * digits[3]
  end

  def to_roman
    number << convert_thousands if digits[3]
    number << convert(2, HUNDRED, FIVE_HUNDRED, THOUSAND) if digits[2]
    number << convert(1, TEN, FIFTY, HUNDRED) if digits[1]
    number << convert(0, ONE, FIVE, TEN) if digits[0]
    number
  end
end

number = RomanNumeral.new(1)
p number.to_roman





