FactoryGirl.define
  factory :group, :class => Author do |group|
    name              { Faker::Name.name }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
