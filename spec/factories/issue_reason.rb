FactoryGirl.define do
  factory :issue_reason do
    sequence :name do |n|
      "Issue Reason #{n}"
    end
  end
end
