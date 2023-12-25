# frozen_string_literal: true

class UsersProfile < ApplicationRecord
  belongs_to :user

  validates :full_name, length: { maximum: 100 }
  validates :address, length: { maximum: 255 }
  validates :phone_number, length: { maximum: 20 }
end
