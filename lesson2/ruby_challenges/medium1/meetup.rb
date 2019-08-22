# date.new(year, month, day)
# initialize a meetup object specifying the month and year of the meetup
# need to use day method to specify day of the meetup within that month and year

# .cwday on a date object returns the day of calendar week (1-7, Monday is 1).
# date class also has .friday? etc methods


class Meetup
  attr_reader :month, :year
  attr_accessor :dates
  
  WEEKDAY_CONV = { monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday:6, sunday:7 }

  def initialize(month, year)
    @month = month
    @year = year
    @dates = []
  end

  def day(weekday, schedule)
    weekday_num = WEEKDAY_CONV[weekday]

    begin
    (1..31).each do |day|
      if Date.new(year, month, day).cwday == weekday_num
        dates << Date.new(year, month, day)
      end
    rescue ArgumentError
      break
    end
    end

    case schedule
    when :first then dates[0]
    when :second then dates[1]
    when :third then dates[2]
    when :fourth then dates[3]
    when :last then dates[-1]
    when :teenth then find_teenth_date
    end
  end

  def find_teenth_date
    dates.each do |date|
      return date if [13, 14, 15, 16, 17, 18, 19].include?(date.day)
    end
  end
end

p Meetup.new(6, 2019).day(:monday, :teenth)
