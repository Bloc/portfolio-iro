---
layout: post

title: PTO 

feature-img: "img/events_controller.png"
thumbnail-path: "img/calendar_controller.png"
short-description: Paid Time Off  Calendar!

---
 The PTO project was designed to track and schedule an employees paid time off.  This was not a preset bloc project . It allows employees to look at a calendar and request Paid Time Off from the calendar, that employees manager can then approve or disapprove a request. From the managers calendar they can see all scheduled PTO on a given calendar. Thus, schedule around those requests.
 
 ___

*Here is the index page that includes a register menu; listing current user, their role, and options such Editing and Upgrading the users role. It also provides a menu bar that currently has two primary links: Calendar and Change Events.*
{:.center}
![]({{ site.baseurl }}/img/Frontpage.png)

---


The calendar
{:.center}
![]({{ site.baseurl }}/img/employee_calendar
.png)

New Event for PTO.

*From the drop-down an employee or  manager can add an event which will be displayed on the calendar for a that given date.*
{:.center}
![]({{ site.baseurl }}/img/New_Event_PTO
.png)

---

Manager's calendar.

*From this calendar a manager can see all requests from employees. Here John Smith has the role of admin.*
{:.center}
![]({{ site.baseurl }}/img/mgr_calendar
.png)

___

Events page
{:.center}
![]({{ site.baseurl }}/img/Allevents.png)

___
Company “W” currently employs 12,000 employees, within 32 departments, with multi-managers, running three shifts 24-7-365. Today, their use a paper Paid Time Off. The forms consist of a request form and attached calendar. There are three copies made; employee’s, supervisor manager’s, and department head’s. Per interoffice mail (snail mail) another copy is send to Human Relations, there an employee manually enters information into ERP software. Checking the status of PTO hours (or days) available for that employee. Two more copies are made; one heading to accounting/payroll and the other back to the department head.  Usually, takes seven to ten days to filter thru the system and between twenty to thirty sheets of paper, and the labor involves seven or eight people touching each “Request for PTO” form.  The currently system is a mess. 

___
Benefit chart
{:.center}
![]({{ site.baseurl }}/img/TaskUARB.png)

___


Code for the calendar structure.
{% highlight javascript %}
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
{% endhighlight %}
 Have an employee login to their personal company account. From there provide a web page base interface. Thru a calendar form that displays current status of PTO available. Here, once a manager approves the request all parties have access to the data. The employee, Human relations, accounting/payrolls. Each event has an ID. And that data can be migrated into a given database. 
 
With Ruby on rails, I created an application that along with a bit of CSS launched a register page, a calendar, a short option menu. Giving all parties access of their data. This project could be developed farther depending on the organization and data needed. This project was developed over a three week period. 
