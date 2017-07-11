# Earlybird

![](screenshots/home.png?raw=true)

[Earlybird Search Website](https://early-bird-search.herokuapp.com)

[Team Github](https://github.com/EarlyRavens)

## Description

As a young developer with a business mindset, I identified the difficulty freelance developers have obtaining clients. After speaking with small business owners I knew, I realized that a large part of the problem was that many small business owners were simply not aware of their needs for web development. In response to both issues, my team and I created a platform that assists web developers in identifying potential customers by finding successful businesses with either poorly constructed websites or without websites. We used a series of modern technologies with a Service Oriented Architecure to maximize scalability and compatability. My primary role in this project was as the architect in addition to algorithm optimization and project management. 

## Searching

![](screenshots/search.png?raw=true)

After logging in and clicking the search link on the home page, you will be lead to this page.  You enter in a zip code and a category as you would normally search on yelp and click search. An API request is made to the Early Bird Search API that we created.

![](screenshots/load.png?raw=true)

Due to the enormous amount of information being analyzed, the loading time for the search is between 10-15 seconds. The Early Bird Search API utilizes the Yelp API to generate list of potential clients whose websites we analyze utilizing a combination of webscraping techniques and various webpage analytics APIs from Google. Since each search requests makes a large number of API calls, the initial run time was over 5 minutes to analyze simply 10 potential clients. The final production API analyzes 5x the number of clients in about 3% of the time due to the implementation of concurrency (via threading) and algorithm optimization. 

![](screenshots/results.png?raw=true)

Once our application receives the JSON response from our Rails API, we dynamically load the results on to the page using React.JS on our front end. Each of the results is a potential client for web development from an established business (based on Yelp's sorting algorithm) in the area that you selected.

## The Team

![](screenshots/team.jpg?raw=true)

[Patrick Tangphao](https://github.com/ptangphao)

[Earl Sabal](https://github.com/earlsabal)

[Mina Melosh](https://github.com/minamelosh)

[Max Peiros](https://github.com/mpeiros)

[Helen Khumthong](https://github.com/tamietta)

Technologies we used were: 
- Ruby on Rails
- Phoenix with Elixir
- Slackbot
- Swift
- React.js
- Yelp API
- Google API
- Multi-Threading
