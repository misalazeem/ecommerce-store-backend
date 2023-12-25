# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false, limit: 255
      t.text :description
      t.decimal :price, precision: 10, scale: 2, null: false
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
