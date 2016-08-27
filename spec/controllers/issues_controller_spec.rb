require 'rails_helper'

RSpec.describe IssuesController, type: :controller do

  context "issues > 0" do
    before :each do
      FactoryGirl.create_list(:issue, 5)
    end
    it "return a list of issues" do
      get :index
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json.length).to eq(5)
    end
  end
end
