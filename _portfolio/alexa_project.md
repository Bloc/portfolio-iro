---
layout: post
title: Alexa Project
feature-img: "img/amazon-echo.png"
thumbnail-path: "img/amazon-echo.png"
short-description: Amazon Echo Alexa project

---
Amazon's Echo Alexa project is a speech recognition app for the stand-alone device. 
By creating a Lambda function code can be uploaded to the AWS console.

{:.center}
![]({{ site.baseurl }}/img/lambda_function.png)

---
The developer console sets several testing and configurations. The Compliance timeframe is quick and informative. 

{:.center}
![]({{ site.baseurl }}/img/developerAmazon.png)

---
From one of my skills for Alexa. Code to randomly pick a fact the database of facts.

{% highlight javascript %}
/**
 * Gets a random new fact from the list and returns to the user.
 */
function handleNewFactRequest(response) {
    // Get a random space fact from the space facts list
    var factIndex = Math.floor(Math.random() * FACTS.length);
    var randomFact = FACTS[factIndex];

    // Create speech output
    var speechOutput = "Here's your fact: " + randomFact;
    var cardTitle = "Your Fact";
    response.tellWithCard(speechOutput, cardTitle, speechOutput);
}

// Create the handler that responds to the Alexa Request.
exports.handler = function (event, context) {
    // Create an instance of the SpaceGeek skill.
    var fact = new Fact();
    fact.execute(event, context);
};
{% endhighlight %}

---