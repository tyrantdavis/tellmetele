require 'rails_helper'

RSpec.describe "welcome/index.html.erb", type: :view do

    describe "GET #index" do
      it "renders the Welcome template" do
        render :template => "welcome/index"
        expect(rendered).to match /Tvs' Most Popular/
      end
    end

end
