FactoryGirl.define do
  factory :state do
   sequence :abbreviation do |n|
     "S#{n}"
   end
   sequence :name do |n|
     "State#{n}"
   end
  end
end
