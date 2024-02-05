class Clock
  attr_reader :hours, :minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end

  def +(num)
    new_hours = @hours
    new_minutes = @minutes + num

    new_hours, new_minutes = adjust_plus(new_hours, new_minutes)

    Clock.new(new_hours, new_minutes)
  end

  def -(num)
    new_hours = @hours
    new_minutes = @minutes - num

    new_hours, new_minutes = adjust_minus(new_hours, new_minutes)

    Clock.new(new_hours, new_minutes)
  end

  def adjust_plus(hrs, mins)
    while mins > 59
      hrs += 1
      mins -= 60
    end

    while hrs > 23
      hrs -= 24
    end

    return hrs, mins
  end

  def adjust_minus(hrs, mins)
    while mins < 0
      hrs -= 1
      mins += 60
    end

    while hrs < 0
      hrs += 24
    end

    return hrs, mins
  end

  def to_s
    sprintf("%02d", @hours) + ":" + sprintf("%02d", @minutes)
  end

  def ==(clock)
    self.hours == clock.hours && self.minutes == clock.minutes
  end
end

puts Clock.at(8)


