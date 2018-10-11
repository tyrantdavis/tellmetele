# TellMeTele:
###### What's <b>POP</b>pin tv!

A tv searching app that helps you find and review details about the most popular tv shows. Based on data from
  [The MovieDb](https://developers.themoviedb.org/3/getting-started) API.

---
## Simple to use

When you visit the app you are presented with the most popular shows. Other than that, click the link to see all tv shows, or search out a show via the search bar.
## Objective:

Create a TV show discovery web app using the open-source Movie Database API.

### Functional Requirements
1. When first loaded, there should be a list of popular TV shows and a search bar.
2. Upon searching for a TV show in the search bar, the user should see a list of shows whose title matches the search.
3. After clicking on a TV show, the user should be taken to a page with more information about that particular TV show.

### Technical Requirements
1. Create a full-stack application with a backend that communicates with the movie API.
2. The front-end should be intuitive to use.
3. Accompany your code with a full test suite.
4. Deploy your site to a web host (e.g. on Amazon EC2, Heroku, Netlify, Google AppEngine, etc.).
## Tech & ArchiTecture

### Tech
I have become really fond of the front-end. I considered going with a complete  MEAN  or MERN architecture minus the  database. I am much more familiar with Ruby. Rails was my framework of choice and the best decision for me ultimately. More over, I really like Ruby. I find it elegant.   

I also considered Sinatra for it's simplicity. I found it too simplistic for my needs however. I consider how the app might grow and concluded that I did not want to lose the flexibility or the defaults Rails offers. I did not want to give up the way Rails effortlessly generates all the necessary files for controllers and models, the way it handles views, or lose the ease of access to the asset pipeline . Rails all the way!

### Architecture
* RoR 5.2.1
* Ruby ruby '~> 2.5.1'
* W3CSS - Rails
* Figaro
* httparty
* will paginate

* Figaro to securely add and store my API KEY.
* HTTParty to connect to database via HTTP.
* Created RESTful API.



### Trade-offs:
- Utilized models to manage the  [The MovieDb](https://developers.themoviedb.org/3/getting-started) API. They handled data queries and retrieval transmissions for the target data. The controllers captured, then logically and systematically, moved the data around in preparation for the views. The data was subsequently relayed to the appropriate view(s) and rendered as needed.

* I could have gone with only controllers and helpers.

#### User Model or Session and Params:

- I chose session and params for persistent sessions and requests. An ActiveRecord model would have been overkill. 

- Search Form: Whether to submit using POST or GET. I chose Get because it is best practices and it allows  adding functionality for users i.e a bookmarking or review capabilities. 

- POST action could have resulted in the search terms not applying to subsequent pages.  

- Caching is another benefit of GET. Browsers and proxies cache content readily.

### Pagination:
- Use active record or not:
- I was reluctant to use will paginate considering ActiveRecord was not used for this app. The documentation convinced me otherwise however. I discovered that I could use will_paginate-collection on any array passed in for the same results. Whaaaat! Sign me up. 

I was torn between offset pagination and cursor based pagination. I chose offset because it was easier to implement.

- Vars:
I chose to use local variables in my controllers and render those to the view as opposed to instance variables.  This is suppose to be best practices from what I have read.  I had issues with the dreaded and unpredictable nil when dealing with instance variables.   


What I would do differently:
- Front end stack
- CLI
- Added Movies
- Different styling
- Would have gone with a vivid color pattern
- Black UI 
- More tests
- Enhanced search functionality
- Added music to the homepage
