require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  before(:all) do
    @popular = Tv.get_popular_shows['results'].take(9)
    @big_bang = Tv.get_popular_shows['results'][0]['original_name']
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns an Array" do
      expect(@popular).to be_a(Array)

    end

    it "returns an Array that is not empty" do
      expect(@popular).not_to be_empty
    end

    it "the Array - returns 9 shows " do
      expect(@popular.count).to eql(9)
    end

    it "returns show data as a Hash" do
      expect(@popular[0]).to be_a(Hash)
    end

    it "returns the The Big Bang Theory" do
      expect(@big_bang).should eql?(/The Big Bang Theroy/)
    end
  end

end
