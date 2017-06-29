--
layout: post
title: BlocFlix
thumbnail-path: "img/blocflix.png"
short-description: BlocFlix is a Netflix replica for finding the best movies and watching them online.
--
### Project screenshot

{:.center}
![]({{ site.baseurl }}/img/blocflix.png)

### Code snippets

{% highlight ruby %}
def show
  @widget = Widget(params[:id])
  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @widget }
  end
end
{% endhighlight %}
