FactoryGirl.define do
  factory :issue do
    body Faker::Lorem.paragraph
    customer
    issue_type
    issue_reason
    state
  end
end
