require 'rails_helper'

RSpec.describe Issue, type: :model do
  let(:issue) { Issue.new }

describe 'relationships' do
  it { expect(issue).to belong_to(:customer) }
  it { expect(issue).to belong_to(:issue_type) }
  it { expect(issue).to belong_to(:issue_reason) }
end

describe 'validations' do
  it { expect(issue).to validate_presence_of(:body) }
  it { expect(issue).to validate_presence_of(:issue_type_id) }
  it { expect(issue).to validate_presence_of(:issue_reason_id) }
  it { expect(issue).to validate_presence_of(:customer) }
end

describe '.group_by_date_and_state' do
  let(:state1){FactoryGirl.create(:state, abbreviation: 'RJ', name: 'Rio de Janeiro')}
  let(:state2){FactoryGirl.create(:state, abbreviation: 'SP', name: 'São Paulo')}
  let(:state3){FactoryGirl.create(:state, abbreviation: 'MG', name: 'Minas Gerais')}
  let!(:issue1){FactoryGirl.create(:issue, state: state2, created_at: Time.now - 5.hour)}
  let!(:issue2){FactoryGirl.create(:issue, state: state2, created_at: Time.now - 2.hour)}
  let!(:issue3){FactoryGirl.create(:issue, state: state1, created_at: Time.now - 3.hour)}
  let!(:issue4){FactoryGirl.create(:issue, state: state3, created_at: Time.now - 4.hour)}
  it 'should return issues grouped by state and ordered by date desc' do
    expect(Issue.group_by_date_and_state).to eq([
      issue4,
      issue3,
      issue2,
      issue1
      ])
  end
end

end
