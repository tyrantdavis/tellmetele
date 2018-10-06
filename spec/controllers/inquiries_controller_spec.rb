require 'rails_helper'

RSpec.describe InquiriesController, type: :controller do
    let(:expression)  {"Real Husbands"}
    let(:pg) {1}
    let(:parsed_inquiry ){Inquiry.about(expression, pg)}
    inquiry_results {parsed_response['results']}
    let(:results_total) {parsed_inquiry['total_results']}
    let(:pg_total ){parsed_inquiry['total_pages']}


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns an Array" do
      expect(parsed_inquiry).to be_a(Array)
    end

    it "returns an Array that is not empty" do
      expect(parsed_inquiry).not_to be_empty
    end

    it "Returns the correct number of results" do
      expect(results_total).to eql 2
    end

    it "Returns the correct number of results pages" do
      expect(pg_total).to eql 1
    end
  end


end
