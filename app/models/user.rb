class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_groups
  #先に中間テーブルを定義して置かないと下のthroughが何を指しているのかわからなくなる。
  has_many :groups, through: :user_groups
  has_many :messages

  scope :search_like_name, ->(name){ where('name LIKE(?)', "%#{name}%") }
end
