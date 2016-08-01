require 'rails_helper'

RSpec.describe Issue, type: :model do
  let(:issue) { Issue.new }

describe 'relationships' do
  it { expect(issue).to belong_to(:issue_type) }
  it { expect(issue).to belong_to(:issue_reason) }
end

describe 'validations' do
  it { expect(issue).to validate_presence_of(:body) }
  it { expect(issue).to validate_presence_of(:issue_type_id) }
  it { expect(issue).to validate_presence_of(:issue_reason_id) }
end

end
