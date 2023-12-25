# frozen_string_literal: true

class OrdersItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true
  validates :price, presence: true
end
