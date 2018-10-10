# TellMeTele:
###### What's <b>POP</b>pin tv!

A tv searching app that helps you find and review details about the most popular tv shows. Based on data from
  [The MovieDb](https://developers.themoviedb.org/3/getting-started) API.

---
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

####
Trade-offs

Model, Session, or Params:
- User model vs session or params for persistence
- Search Form: Whether to submit using POST or GET. I chose Get because it is best practices and it allows  adding functionality for users i.e a bookmarking or review capabilities.

- POST action could have resulted in the search tern not applying to subsequent pages.  
- Caching is another benefit of GET. Browsers and proxies cache content easily.

Pagination:
- Use active record or not:
I was torn between offset pagination and cursor based pagination. I chose offset because it it easier to implement. Moreover, it is hard to keep accurate page count for live data as it changes often. This means a more complicated implementation to deal with data is added or removed.

- Had to use will_paginate/collection since this is non active record based

- Vars:
I chose to use local variables and render those to the view as opposed to instance variables. I had issues with the dreaded ##nil when dealing with instance variables. This is suppose to be best practices from what I have read.   


What I wold do differently:
- Front end stack
- CLI
- Added Movies
- Different styling
- Would have gone with a vivid color pattern.
- Black UI 
- More tests
- Enhanced search functionality
