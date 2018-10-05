class WelcomeController < ApplicationController
  def index
    parsed_response = Tv.get_popular_shows.parsed_response
    popular_shows = parsed_response['results'].take(9)
    pages = parsed_response['total_pages']
    
    render :index, locals: {
      popular_shows: popular_shows,
      pages: pages
    }
  end
end
