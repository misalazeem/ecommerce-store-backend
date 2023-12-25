# frozen_string_literal: true

class CreateOrdersItems < ActiveRecord::Migration[7.1]
  def change
    create_table :orders_items do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
