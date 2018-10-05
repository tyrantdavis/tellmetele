class Tv < ApplicationRecord
  include HTTParty

  base_uri 'https://api.themoviedb.org/3'
  default_params api_key: ENV['API_KEY']
  format :json

  def Tv.get_popular_shows
    get("/discover/tv", query: {sort_by: "popularity.desc"})
  end

end
