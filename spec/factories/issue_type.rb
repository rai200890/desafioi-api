FactoryGirl.define do
  factory :issue_type do
    sequence :name do |n|
      "Issue Type #{n}"
    end
  end
end
