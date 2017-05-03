class Group < ApplicationRecord
  has_many :users, through: :user_groups
  accepts_nested_attributes_for :users
  has_many :messages
  has_many :user_groups
end
