require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe '#index' do
    before :each do
      FactoryGirl.create_list(:customer, 5)
    end
    it 'should return a list of issues' do
      get :index
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json['customers'].first.keys).to include('id',
                                                      'name',
                                                      'email',
                                                      'phone',
                                                      'id_card_code')
      expect(json['customers'].length).to eq(5)
    end
    it 'should return pagination info' do
      get :index
      json = JSON.parse(response.body)
      expect(json['meta'].keys).to include('current_page',
                                           'next_page',
                                           'prev_page',
                                           'total_pages',
                                           'total_count')
    end
    it 'should filter by text' do
      get :index, {by_name_or_id_card_code_or_phone: Customer.last.name}
      json = JSON.parse(response.body)
      expect(response).to be_success
    end
  end
end
