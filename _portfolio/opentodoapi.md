---
layout: post
title: Open Todo API
feature-img: "img/sample_feature_img.png"
thumbnail-path: "img/opentodoapi.png"
short-description: External API with Authentication.

---
### Summary:
Open Todo API is an externally usable API for basic to-do list application.  This API will allow users to modify user accounts and to-do items from the command line.

### Explanation:
This is my third Ruby on Rails app that I created with the help of my mentor, Shannon Bertucci, at Bloc. Shannon recommended that I build this project after she heard that I was interested in pursuing an education in mobile app, AR and VR development after I complete my training in full stack and software engineering courses at Bloc.  It's also a fairly different project from Blocipedia and Bloccit, so I felt it would be a good one to work on next.

### Problem: Missing Master Branch
Since Blocipedia took a very long time to properly set up on Heroku (production), I decided that I would tackle this early on for Open Todo API.  I hit an early error with this because I neglected to create a master branch.  When I tried to push to Heroku using `git push heroku master`, Heroku promptly gave me this error:

{% highlight ruby %}
error: src refspec master does not match any.
error: failed to push some refs to 'https://git.heroku.com/still-headland-51006.git'
{% endhighlight %}

### Solution:
To solve this missing master branch, Shannon showed me how to create a master branch as follows (all to be done in the terminal):
1. `git checkout -b master`
* to create the missing master branch
2. `git push origin master`
* to push all current code/work on my other branch onto master branch
3. `git push heroku master`
* to push all code to Heroku (production)

### Problem: `.as_json` vs. `.to_json`
I ran into another error where I wasn't able to get my JSON output to validate using a site like [JSONLint](http://jsonlint.com/).  Running my code with `.as_json` would give me the following:

{% highlight ruby %}
irb(main):017:0> ItemSerializer.new(Item.first).as_json
  Item Load (0.5ms)  SELECT  "items".* FROM "items"  ORDER BY "items"."id" ASC LIMIT 1
=> {:id=>1, :created_at=>"September 08, 2016", :list_id=>1, :text=>"First to do item"}
irb(main):018:0> ListSerializer.new(List.first).as_json
  List Load (0.4ms)  SELECT  "lists".* FROM "lists"  ORDER BY "lists"."id" ASC LIMIT 1
=> {:id=>1, :created_at=>"September 08, 2016", :user_id=>1, :title=>"First List"}
irb(main):019:0> UserSerializer.new(User.first).as_json
  User Load (0.6ms)  SELECT  "users".* FROM "users"  ORDER BY "users"."id" ASC LIMIT 1
=> {:id=>1, :created_at=>"September 03, 2016", :full_name=>"First User", :email=>"user@email.com", :bio=>nil}
{% endhighlight %}

### Solution:
I googled around and found this [Stack Overflow solution](http://stackoverflow.com/questions/37401367/activemodelserializer-not-returning-valid-json-in-rails-console-test) and discovered that I should use `.to_json` instead.  Using `.to_json` gave me this JSON output that is indeed valid:

{% highlight ruby %}
irb(main):014:0> UserSerializer.new(User.first).to_json
  User Load (3.3ms)  SELECT  "users".* FROM "users"  ORDER BY "users"."id" ASC LIMIT 1
=> "{\"id\":1,\"created_at\":\"September 03, 2016\",\"full_name\":\"First User\",\"email\":\"user@email.com\",\"bio\":null}"
irb(main):015:0> ListSerializer.new(List.first).to_json
  List Load (2.8ms)  SELECT  "lists".* FROM "lists"  ORDER BY "lists"."id" ASC LIMIT 1
=> "{\"id\":1,\"created_at\":\"September 08, 2016\",\"user_id\":1,\"title\":\"First List\"}"
irb(main):016:0> ItemSerializer.new(Item.first).to_json
  Item Load (0.7ms)  SELECT  "items".* FROM "items"  ORDER BY "items"."id" ASC LIMIT 1
=> "{\"id\":1,\"created_at\":\"September 08, 2016\",\"list_id\":1,\"text\":\"First to do item\"}"
{% endhighlight %}

### Problem: `rails g migration`
This project had me using `rails g migration` quite a lot to create the many columns in my `user`, `list`, and `item` models.  I ultimately created an incorrect column and had to look up how to undo this incorrect column. For instance, I created the incorrect `Private` column in my `Lists` model.  I wanted to drop the incorrect column, but accidentally looked up how to drop an incorrect table instead and ran this code in the terminal: `rails g migration DropPrivate`.

### Solution:
To solve this issue, I had to undo the incorrect code with: `rails destroy migration DropPrivate`.  However, I still needed to remove the column.  To do that, I discovered that I could use this code: `rails g migration RemovePrivateFromLists`.  Then in the migration file, I needed to update it as so:

{% highlight ruby %}
class RemovePrivateFromLists < ActiveRecord::Migration
  def change
    remove_column :lists, :private
  end
end
{% endhighlight %}

And then, run this in the terminal `rake db:migrate`.  And finally check in `schema.rb` to see that the `private` column has indeed been removed.

### Results:
Since I was constantly adding and removing columns to this project and the database needed to be wiped a few times, I worked on testing this app several times throughout my building process in development.  This involved a lot of `curl -u` in the terminal to create/delete/modify users, lists, and items.  You can check out the app here: [Open Todo API](https://still-headland-51006.herokuapp.com/)

### Conclusion:
If my second Ruby on Rails app helped me feel more confident in the world of Rails and back end development, Open Todo API helped me feel like I could potentially get a job as a Rails developer.  Having a second app under my belt (without following a step by step tutorial) really made me feel good about coding in general.  The struggle certainly felt very real and massive at times, but the feeling of completing another app really gave my confidence a boost.  I feel like every solution I found to each problem I hit is another step closer to being a pro at this.  In fact, I even feel more confident in learning my next language.  I have a feeling that when I hit my future problems, I will feel less dismayed and defeated (like I did with my first Rails apps).  Instead, I'll have these apps to remember how struggling and struggling does indeed result in solutions and a sense of confidence in myself as a developer.
