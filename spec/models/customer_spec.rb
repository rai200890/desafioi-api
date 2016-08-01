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

end
