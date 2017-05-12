FactoryGirl.define do

  factory :message do
    body         { Faker::Name.name }

    # association :group, factory: :group
    # association :user, factory: :user
  end

end
