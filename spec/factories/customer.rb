FactoryGirl.define do
  factory :customer do
    name Faker::Name.name_with_middle.next
    phone Faker::PhoneNumber.phone_number.next
    email Faker::Internet.free_email.next
    sequence :id_card_code do |n|
      "#{Faker::Company.ein.next}#{n}"
    end
  end
end
