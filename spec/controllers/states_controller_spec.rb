require 'rails_helper'

RSpec.describe StatesController, type: :controller do
  before :each do
    FactoryGirl.create_list(:state, 5)
    get :index
  end
  it 'should return a list of states' do
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json['states'].first.keys).to include('abbreviation', 'name')
    expect(json['states'].length).to eq(5)
  end
end
