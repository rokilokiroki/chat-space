FactoryGirl.define do
  pass = Faker::Internet.password(8)

  factory :user do
    name                  Faker::Name.name
    email                 Faker::Internet.email
    password              pass
    password_confirmation pass

    # after(:create) do |user|
    #   # temp_group =
    #   group = create(:group, users: user)
    #   # ここでgroupをcreateしてtemp_groupに入れる
    #   create(:message, user: user, group: group)
    #   create(:user_groups, user: user, group: group)
    # end
  end
end
