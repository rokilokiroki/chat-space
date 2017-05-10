FactoryGirl.define
  factory :user, :class => Author do |user|
    name              { Faker::Name.name }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
