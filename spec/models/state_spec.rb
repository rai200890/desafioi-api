require 'rails_helper'

RSpec.describe State, type: :model do
  let(:state) { State.new }

  describe 'relationships' do
    it { expect(state).to have_many(:issues) }
  end

  describe 'validations' do
    it { expect(state).to validate_presence_of(:name) }
    it { expect(state).to validate_uniqueness_of(:name) }
    it { expect(state).to validate_presence_of(:abbreviation) }
    it { expect(state).to validate_uniqueness_of(:abbreviation) }
  end

end
