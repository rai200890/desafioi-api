require 'rails_helper'

RSpec.describe IssueReason, type: :model do
  let(:issue_reason) { IssueReason.new }

  describe 'relationships' do
    it { expect(issue_reason).to have_many(:issues) }
  end

  describe 'validations' do
    it { expect(issue_reason).to validate_presence_of(:name) }
    it { expect(issue_reason).to validate_uniqueness_of(:name) }
  end
end
