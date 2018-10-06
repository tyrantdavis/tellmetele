require 'rails_helper'

RSpec.describe Tv, type: :model do

    let(:tv_response) {Tv.get_popular_shows}


  describe ".get_popular_shows" do
    it "responds successfully" do
      expect(response).to have_http_status(:success)
    end

    it "returns a HTTParty response" do
      expect(tv_response).to be_a(HTTParty::Response)
    end

    it "returns data" do
      expect(result).to be
    end
  end

end
