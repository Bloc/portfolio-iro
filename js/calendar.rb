
require "active_support/core_ext/date"
require "active_support/core_ext/time"
require "active_support/core_ext/array"

class Calendar
  def initialize(date=Date.today)
    @date = date

  end

  def to_a
    CalendarWeeks.new(@date).to_a.map do |week|
      week.map do |date|
        [date, CalendarStyles.new(date).to_s]
      end
    end
  end
end


class CalendarStyles
  def initialize(date)
    @date = date
  end

  def to_s
    [past, today, future, other_month].compact.join(" ")
  end


  private

  def past
    "past" if @date < Date.today
  end

  def today
    "today" if @date == Date.today
  end

  def future
    "future" if @date > Date.today
  end

  def other_month
    "other_month" if @date.month != Date.today.month
  end
end



class CalendarWeeks

  def initialize(date=Date.today)
    @date = date
  end

  def to_a
    (first_calendar_day..last_calendar_day).to_a.in_groups_of(7)
  end

    def starting_date
      starting_date = Time.now.months_since(1).to_date
    end

    def past_date
      past_date = Time.now.months_since(-1).to_date
    end
  private

  def first_calendar_day
    @date.beginning_of_month.beginning_of_week(:sunday)
  end

  def last_calendar_day
    @date.end_of_month.end_of_week(:sunday)
  end

end
