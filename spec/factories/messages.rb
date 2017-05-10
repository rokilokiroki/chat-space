FactoryGirl.define do

  factory :message do
    body              { Faker::Name.name }
    user_id           "3"
    group_id          "30"
    image ""
  end

end
