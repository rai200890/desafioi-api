require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { Customer.new }

  describe 'relationships' do
    it { expect(customer).to have_many(:issues) }
  end

  describe 'validations' do
    it { expect(customer).to validate_presence_of(:name) }
    it { expect(customer).to validate_presence_of(:email) }
    it { expect(customer).to validate_presence_of(:phone) }
    it { expect(customer).to validate_presence_of(:id_card_code) }
    it { expect(customer).to validate_uniqueness_of(:id_card_code) }
  end

  describe '.by_id_or_name_or_email_or_phone' do
    context 'given id exists' do
      let!(:customer){FactoryGirl.create(:customer, id: 3)}
      it 'should return the customer' do
        expect(Customer.by_id_or_name_or_email_or_phone(3)).to eq([customer])
      end
    end
    context 'given name exists' do
      let!(:customer){FactoryGirl.create(:customer, name: 'Raissa Ferreira')}
      it 'should return the customer' do
        expect(Customer.by_id_or_name_or_email_or_phone('Raissa')).to eq([customer])
      end
    end
    context 'given email exists' do
      let!(:customer){FactoryGirl.create(:customer, email: 'rai200890@gmail.com')}
      it 'should return the customer' do
        expect(Customer.by_id_or_name_or_email_or_phone('rai200890@gmail.com')).to eq([customer])
      end
    end
    context 'given phone exists' do
      let!(:customer){FactoryGirl.create(:customer, phone: '12345678')}
      it 'should return the customer' do
        expect(Customer.by_id_or_name_or_email_or_phone('12345678')).to eq([customer])
      end
    end
    context 'given field doesn\'t exist' do
      it 'should return empty list' do
        expect(Customer.by_id_or_name_or_email_or_phone('12345678')).to be_empty
      end
    end
  end

end
