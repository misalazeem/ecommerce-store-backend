# frozen_string_literal: true

class Discount < ApplicationRecord
  has_many :discounted_products, dependent: :destroy

  validates :code, uniqueness: true, length: { maximum: 20 }
  validates :discount_type, length: { maximum: 20 }
end
