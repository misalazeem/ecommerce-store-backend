class CreateDiscounts < ActiveRecord::Migration[7.1]
  def change
    create_table :discounts do |t|
      t.string :code, true, limit: 20
      t.string :discount_type, limit: 20
      t.decimal :discount_value, precision: 5, scale: 2
      t.timestamp :start_date
      t.timestamp :end_date
      t.boolean :active, default: true
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :discounts, :code, unique: true
  end
end
