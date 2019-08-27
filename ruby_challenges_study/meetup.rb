# Date is Date.new(year, month, day),
# Date class has .monday? function
# pass the weekday as weekday to the date 
# date.send "#{weekday}?"
# and schedule is :first, :second, :third, :fourth, :last or :teenth.

require 'date'
require 'pry'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    today = Date.new(@year, @month, 1)
    weekdays = []
    loop do
      weekdays << today if today.send "#{weekday}?"
      today = today.next
      break if today.day == 1
    end
    
    case schedule
    when :teenth
      teen_dates = []
      [13, 14, 15, 16, 17, 18, 19].each { |day| teen_dates << Date.new(@year, @month, day) }
      (teen_dates & weekdays)[0]
    when :first
      weekdays[0]
    when :second
      weekdays[1]
    when :third
      weekdays[2]
    when :fourth
      weekdays[3]
    when :last 
      weekdays[-1]
    end
  end
end

p Meetup.new(8, 2019).day(:thursday, :teenth)