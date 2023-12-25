# frozen_string_literal: true

class Inventory < ApplicationRecord
  belongs_to :product

  validates :quantity, presence: true
end
