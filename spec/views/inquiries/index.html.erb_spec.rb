require 'rails_helper'

RSpec.describe "inquiries/index.html.erb", type: :view do

        # Valid input
        let(:expression)  {"Real Husbands"}
        let(:pg)  {1}
        let(:parsed_inquiry)  {Inquiry.about(expression, pg)}
        let(:inquiry_results)  {parsed_response['results']}
        let(:results_total)  {parsed_inquiry['total_results']}
        let(:pg_total)  {parsed_inquiry['total_pages']}

        # Invlaid input
        invalid_expression  {"sfhdshfhshshjshhs;"}
        let(:pg)  {1}
        let(:invalid_expression_parsed_inquiry)  {Inquiry.about(expression, pg)}
        let(:invalid_expression_inquiry_results)  {parsed_response['results']}
        let(:invalid_expression_results_total)  {parsed_inquiry['total_results']}
        let(:invalid_expression_pg_total ) {parsed_inquiry['total_pages']}

        # Empty input
        let(:empty_expression)  {""}
        let(:pg ) {1}
        let(:empty_expression_parsed_inquiry)  {Inquiry.about(expression, pg)}
        let(:empty_expression_inquiry_results)  {parsed_response['results']}
        let(:empty_expression_results_total)  {parsed_inquiry['total_results']}
        let(:empty_expression_pg_total)  {parsed_inquiry['total_pages']}
      end

      describe "GET inquiry #index" do
        it "renders the Welcome template" do
          render :template => "welcome/index"
          expect(rendered).to match /Inquiry Results/
        end

        it "Returns the correct results for search" do
          render :text => "Real Husbands of Hollywood"
          expect(rendered).to include(/Real Husbands of Hollywood/).and include(/Are Husbands Really Necessary?/)
        end

        it "returns the last tv show 'Are Husbands Really Necessary?' " do
          expect(inquiry_results.last).to eql /Are Husbands Really Necessary?/
        end

      end

      describe "Errors: matching error message with string" do
        context "Invalid query returns: Error: Invalid input. Please try again. And includes msg ' 0 found for sfhdshfhshshjshhs '; " do
          expect { invalid_expression_parsed_inquiry.raise StandardError, "Error: Invalid input. Please try again." }.
          to raise_error(StandardError, "Error: Invalid input. Please try again.").
          and include("0 found for sfhdshfhshshjshhs;")
        end

        context "Empty query returns: Error: Empty input. Query must be provided. Includes Results: 0 " do
          expect { empty_expression_parsed_inquiry.is_expected.to contain_exactly("Error: Empty input. Query must be provided.") }.
          to raise_error(StandardError, "Empty input. Query must be provided.").
          and include("Results: 0")
        end
      end

end
