FactoryGirl.define do

  factory :message do
    body              { Faker::Name.name }
    user_id           { Faker::Number.between(1, 10) }
    group_id          { Faker::Number.between(14, 38) }
    image ""
  end

end
