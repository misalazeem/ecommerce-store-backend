class User < ApplicationRecord
  has_one :user_profile, dependent: :destroy
  has_many :orders, dependent: :nullify

  validates :username, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :password_hash, presence: true
end
