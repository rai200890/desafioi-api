require 'rails_helper'

RSpec.describe IssuesController, type: :controller do

  context 'issues > 0' do
    before :each do
      FactoryGirl.create_list(:issue, 5)
      get :index
    end
    it 'should return a list of issues' do
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json['issues'].first.keys).to include('id', 'body','issue_type',
      'issue_reason','customer','state')
      expect(json['issues'].length).to eq(5)
    end
    it 'should return pagination info' do
      json = JSON.parse(response.body)
        expect(json['meta'].keys).to include('current_page',
        'next_page','prev_page','total_pages','total_count')
    end
  end
end
