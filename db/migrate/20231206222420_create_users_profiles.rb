class CreateUsersProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :users_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :full_name, limit: 100
      t.string :address, limit: 255
      t.string :phone_number, limit: 20
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
