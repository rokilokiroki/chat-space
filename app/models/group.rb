class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :messages

  validates :name, presence: true

end

# has_manyは配列を期待している。から配列。
