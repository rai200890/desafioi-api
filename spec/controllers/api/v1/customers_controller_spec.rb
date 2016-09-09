require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do
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
      get :index, params: {by_id_or_name_or_email_or_phone: Customer.last.name}
      json = JSON.parse(response.body)
      expect(response).to be_success
    end
  end
  describe '#create' do
    describe 'with invalid params' do
      it 'should return an error message' do
      post :create, params: {customer: {name: 'Raissa', email: 'rai200890@gmail.com'}}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to_not be_empty
      end
    end
    describe 'with valid params' do
      let(:customer_params) do
        {
           name: 'Raissa',
           email: 'rai200890@gmail.com',
           phone: '12345678',
           id_card_code: '2134556576876'
        }
      end
      it 'should create a customer' do
        post :create, params: { customer: customer_params}
        json = JSON.parse(response.body)
        expect(response).to be_success
        expect(Customer.where(customer_params).count).to be(1)
      end
    end
  end
end
