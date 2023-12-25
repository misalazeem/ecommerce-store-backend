# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :rating
      t.text :comment
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
