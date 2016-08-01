require 'rails_helper'

RSpec.describe DB, type: :model  do

describe '.seed' do
  context "valid parameters" do
    it "add instances to database" do
     result = DB.seed(IssueReason, [:name], [["telefone"], ["email"], ["chat"]])
     expect(result.failed_instances).to be_empty
     expect(IssueReason.where(name: ["telefone", "email", "chat"]).count).to be 3
    end
  end
    context "invalid parameters" do
      it "not add instances to database" do
        DB.seed(IssueReason, [:name], [["telefone"], ["email"], ["chat"]])
        result = DB.seed(IssueReason, [:name], [["telefone"], ["email"], ["chat"]])
        expect(result.failed_instances.count).to be 3
    end
    end
end

end

describe '.seed_from_file' do
  context "valid parameters" do
    it "add instances to database" do
     result = DB.seed_from_file(file_fixture("states.json"), State, [:id, :name, :abbreviation])
     expect(result.failed_instances).to be_empty
     expect(State.where(abbreviation: ["RJ", "SP"]).count).to be 2
    end
  end
    context "invalid parameters" do
      it "not add instances to database" do
        DB.seed_from_file(file_fixture("states.json"), State, [:id, :name, :abbreviation])
        result = DB.seed_from_file(file_fixture("states.json"), State, [:id, :name, :abbreviation])
        expect(result.failed_instances.count).to be 2
    end
    end
end
