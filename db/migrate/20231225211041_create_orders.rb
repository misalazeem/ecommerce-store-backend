# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.timestamp :order_date, default: -> { 'CURRENT_TIMESTAMP' }
      t.string :status, default: 'Pending', limit: 20
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
