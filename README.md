# Earlybird

![](screenshots/home.png?raw=true)

[Earlybird Search Website](https://early-bird-search.herokuapp.com)

[Team Github](https://github.com/EarlyRavens)

## Description

My team and I identified the difficulty new freelance developers have obtaining clients. In response to the need, we created a platform that assists web developers in identifying potential customers by finding successful businesses with either poorly constructed websites or no website at all. We used a series of modern technologies with a Service Oriented Architecure to maximize scalability and compatability. I also dove into a new language and framework in Elixir and Phoenix and built a working API app to help support the main functionality of the project. Multi-threading was also implemented to sigificantly cut processing time. 

## Searching

![](screenshots/search.png?raw=true)

After logging in and clicking the search link on the home page, you will be lead to this page.  You enter in a zip code and a category as you would normally search on yelp and click search.

![](screenshots/load.png?raw=true)

Loading takes about 10-15 seconds because we are processing a lot of information and assessing data for 50 websites.  Using multi-threading the processing time was cut down to this amount originating from over 5 minutes

![](screenshots/results.png?raw=true)

Finally we have the results that dynamically load on to the page from the use of React.js on our front end.  These are links to the yelp pages of businesses that either have no websites or need improvement on their existing website.


Technologies we used were: 
- Ruby on Rails
- Phoenix with Elixir
- Slackbot
- Swift
- React.js
- Yelp API
- Google API
- Multi-Threading
