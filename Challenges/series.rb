class Series
  attr_reader :series

  def initialize(series)
    @series = series
  end

  def slices(num)
    raise ArgumentError unless series.size >= num

    result = []
    first_char = 0
    while first_char + num <= series.size
      result << series[first_char, num].split("").map(&:to_i)
      first_char += 1
    end
    result
  end
end
