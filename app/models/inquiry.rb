class Inquiry < ApplicationRecord
  include HTTParty

  base_uri 'https://api.themoviedb.org/3'
  default_params api_key: ENV['API_KEY']
  format :json

  def Inquiry.about(expression, page)
    get("/search/multi", query: {query: expression, page: page})
  end

end
