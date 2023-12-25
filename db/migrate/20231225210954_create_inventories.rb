# frozen_string_literal: true

class CreateInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.references :product, foreign_key: true
      t.integer :quantity
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
