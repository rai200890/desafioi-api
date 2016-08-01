require 'rails_helper'

RSpec.describe IssueType, type: :model do
  let(:issue_type) { IssueType.new }

  describe 'relationships' do
    it { expect(issue_type).to have_many(:issues) }
  end

  describe 'validations' do
    it { expect(issue_type).to validate_presence_of(:name) }
    it { expect(issue_type).to validate_uniqueness_of(:name) }
  end
end
