require 'rails_helper'

RSpec.describe Inquiry, type: :model do

    let(:inquiry_response) {Inquiry.about}
    let(:result) {inquiry_response("Real Husbands", 1)}


  describe ".about" do
    it "responds successfully" do
      expect(response).to have_http_status(:success)
    end

    it "returns a HTTParty response" do
      expect(inquiry_response).to be_a(HTTParty::Response)
    end

    it "returns data" do
      expect(result).to be
    end
  end
end
