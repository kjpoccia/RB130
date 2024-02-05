require 'date'

=begin
Instance method #day will take a day of the week and a "schedule"
Create a submethod for each schedule, which takes the day of the week
 - For "first", cycle through the days of the month, beginning with the 1st day
 of the instance month, and return the first date for which the day of the week
 is true
 - For "second", do the same as the above but use a counter to track the number
  of times the day of the week is true. Return the day when the counter is 2
 - For "third", same as above but counter is 3
 - For "fourth", same as above but counter is 4
 - For "fifth", same as above but counter is 5 (return nil if it doesn't happen)
 - For "last", cycle through the days of the month in reverse, starting with the
 last day of the instance month, return the first date for which the day of the 
 week is true
 - For "teenth", cycle through the days 13 - 19, return the first date for which
 the day of the week is true

=end

class Meetup
  attr_reader :year, :month

  DAYS = {'Sunday' => 'sunday?', 'Monday' => 'monday?', 'Tuesday' => 'tuesday?', 
          'Wednesday' => 'wednesday?', 'Thursday' => 'thursday?', 'Friday' => 'friday?',
          'Saturday' => 'saturday?'}

  OCCURRENCES = {'first' => 1, 'second' => 2, 'third' => 3, 'fourth' => 4, 'fifth' => 5 }

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day_of_week, schedule)
    day_of_week.capitalize!
    schedule.downcase!
    case schedule
    when 'last'
      last(day_of_week)
    when 'teenth'
      teenth(day_of_week)
    else
      find_occurrence(day_of_week, OCCURRENCES[schedule])
    end
  end

  def last(day_of_week)
    current_date = Date.new(year, month, -1)
    until current_date.send DAYS[day_of_week]
      current_date -= 1
    end
    current_date
  end

  def teenth(day_of_week)
    current_date = Date.new(year, month, 13)
    until current_date.send DAYS[day_of_week]
      current_date += 1
    end
    current_date
  end

  def find_occurrence(day_of_week, num)
    counter = 0
    current_date = Date.new(year, month, 1)
    loop do
      counter += 1 if current_date.send DAYS[day_of_week]
      break if counter == num
      current_date += 1
      return nil if current_date.month != month
    end
    current_date
  end

end

# meetup = Meetup.new(2015, 12)
# p meetup.day('Friday', 'fifth')


