require 'rails_helper'

RSpec.describe IssueTypesController, type: :controller do
  before :each do
    FactoryGirl.create_list(:issue_type, 5)
    get :index
  end
  it 'should return a list of issue types' do
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json['issue_types'].first.keys).to include('id', 'name')
    expect(json['issue_types'].length).to eq(5)
  end
end
