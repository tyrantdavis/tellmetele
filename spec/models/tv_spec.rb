require 'rails_helper'

RSpec.describe Tv, type: :model do
  before(:all) do
    @response = Tv.get_popular_shows
  end

  describe "#get_popular_shows" do
    it "returns a HTTParty response" do
      expect(@response).to be_a(HTTParty::Response)
    end
  end

end
