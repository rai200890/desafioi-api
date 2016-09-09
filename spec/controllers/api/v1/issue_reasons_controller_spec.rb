require 'rails_helper'

RSpec.describe Api::V1::IssueReasonsController, type: :controller do
  before :each do
    FactoryGirl.create_list(:issue_reason, 5)
    get :index
  end
  it 'should return a list of issue reasons' do
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json['issue_reasons'].first.keys).to include('id', 'name')
    expect(json['issue_reasons'].length).to eq(5)
  end
end
