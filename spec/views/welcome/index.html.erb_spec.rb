require 'rails_helper'

RSpec.describe "welcome/index.html.erb", type: :view do

    describe "GET #index" do
      it "renders the Welcome template" do
        render
        expect(rendered).to match /Welcome/
      end
    end

end
