# frozen_string_literal: true

class CreateDiscountedproducts < ActiveRecord::Migration[7.1]
  def change
    create_table :discountedproducts do |t|
      t.references :product, foreign_key: true
      t.references :discount, foreign_key: true
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
