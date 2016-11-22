---
layout: post
title: World of Bloc
feature-img: "img/HackingWithCoffee.png"

---
When I started the bloc Full Stack Web Developer software program I had one primary goal... learn as much as I could from this experience. 

My programming experience prior to Bloc was an ancient language known as fanuc. I had some exposure to the Java, that kinda of ended after some simple tutorials. So, what was Ruby and how was it on Rails. Front-End, Back-End. I soon found that this world of programming languages had evoluted quite fast. Why Ruby and not Java, or Python, or C++, even Swift.  

The following code, for me was a major breakthrough in understanding the what how and why code worked.  

---

{% highlight javascript %}

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


{% endhighlight %}

___


This give the calendar order. But not structure. That would have to come with some css. 

Once this file was written, I could see the components necessary to construct the database. Then thru the terminal command, I started seeing outcomes such as:

─krobnson@Keiths-MBP ~/bloc/pto ‹ruby-2.2.1› ‹PTO-2_5-calendar*› 
╰─➤  rails c
Loading development environment (Rails 4.2.5)
2.2.1 :001 > Calendar.new.to_a
 => [[[Sun, 29 May 2016, "past other_month"], [Mon, 30 May 2016, "past other_month"], [Tue, 31 May 2016, "past other_month"], [Wed, 01 Jun 2016, "past"], [Thu, 02 Jun 2016, "past"], [Fri, 03 Jun 2016, "past"], [Sat, 04 Jun 2016, "today"]], [[Sun, 05 Jun 2016, "future"], [Mon, 06 Jun 2016, "future"], [Tue, 07 Jun 2016, "future"], [Wed, 08 Jun 2016, "future"], [Thu, 09 Jun 2016, "future"], [Fri, 10 Jun 2016, "future"], [Sat, 11 Jun 2016, "future"]], [[Sun, 12 Jun 2016, "future"], [Mon, 13 Jun 2016, "future"], [Tue, 14 Jun 2016, "future"], [Wed, 15 Jun 2016, "future"], [Thu, 16 Jun 2016, "future"], [Fri, 17 Jun 2016, "future"], [Sat, 18 Jun 2016, "future"]], [[Sun, 19 Jun 2016, "future"], [Mon, 20 Jun 2016, "future"], [Tue, 21 Jun 2016, "future"], [Wed, 22 Jun 2016, "future"], [Thu, 23 Jun 2016, "future"], [Fri, 24 Jun 2016, "future"], [Sat, 25 Jun 2016, "future"]], [[Sun, 26 Jun 2016, "future"], [Mon, 27 Jun 2016, "future"], [Tue, 28 Jun 2016, "future"], [Wed, 29 Jun 2016, "future"], [Thu, 30 Jun 2016, "future"], [Fri, 01 Jul 2016, "future other_month"], [Sat, 02 Jul 2016, "future other_month"]]] 
2.2.1 :002 > 

Now applying CSS to give to page a readable workable format.


 

---


{:.center}
![]({{ site.baseurl }}/img/Calendar_blank.png)

---

From there  I started seeing more possibilities, literally an unlimited of  additions one could add to this Paid Time Off. 

The Future

From there the magic happens. The page has structure, form, style, and an use. Content!!
This process is the creative component that has drawn me to developing code. I got a true sense of creating sometime. 

With that being said, this project is a starting. Depending on the needs from users, 
email notifications could be added. One could spin the calendar off to scheduling 
department daily tasks. It could be intergraded this other softwares. Literally, it can go anywhere
one’s imagination could go.   

I stopped the project at a pre-plan point. It’s kind of like editing a movie. 
You have to at some point just publish your movie.  

The opportunity of building more layers or applications to a project (I think) is the 
future of software development. Thru expansion and or inavoction.  Different programming or possible  new languages of programming software.  Form maybe mobile to the cloud to whatever is next.
I want to be part of what is next.


___
