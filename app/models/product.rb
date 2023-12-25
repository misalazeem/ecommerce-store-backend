# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :inventory, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :product_reviews, dependent: :destroy
  has_many :discounted_products, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :price, presence: true
end
