FactoryGirl.define do

  factory :message, :class => Message do |message|
    body              { Faker::Name.name }
    user_id           { Faker::Number.between(1, 10) }
    group_id          { Faker::Number.between(14, 38) }
    image ""
    assosiation :group, factory: :message
  end

end
