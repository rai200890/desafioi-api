require 'rails_helper'

RSpec.describe IssuesController, type: :controller do
  describe '#index' do
    context 'issues > 0' do
      before :each do
        FactoryGirl.create_list(:issue, 5)
        get :index
      end
      it 'should return a list of issues' do
        json = JSON.parse(response.body)
        expect(response).to be_success
        expect(json['issues'].first.keys).to include('id',
                                                     'body',
                                                     'issue_type',
                                                     'issue_reason',
                                                     'customer',
                                                     'state')
        expect(json['issues'].length).to eq(5)
      end
      it 'should return pagination info' do
        json = JSON.parse(response.body)
        expect(json['meta'].keys).to include('current_page',
                                             'next_page',
                                             'prev_page',
                                             'total_pages',
                                             'total_count')
      end
    end
  end
  describe '#create' do
    let(:customer) { FactoryGirl.create(:customer) }
    let(:issue_type) { FactoryGirl.create(:issue_type) }
    let(:issue_reason) { FactoryGirl.create(:issue_reason) }
    let(:state) { FactoryGirl.create(:state) }
    context 'Valid params' do
      it 'should create a issue' do
        post :create, params: {issue: {
          body: 'body',
          issue_type_id: issue_type.id,
          issue_reason_id: issue_reason.id,
          customer_id: customer.id,
          state_id: state.id
        }
      }

        expect(response).to have_http_status(:created)
      end
    end
    context 'Invalid params' do
      it 'should return errors' do
        post :create, params: {issue: {
          body: 'body'
        }
      }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to_not be_empty
      end
    end
  end
end
