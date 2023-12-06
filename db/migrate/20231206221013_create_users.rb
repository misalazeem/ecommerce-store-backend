class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, limit: 50
      t.string :email, null: false, limit: 100
      t.string :password_hash, null: false
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :users, :email, unique: true
  end
end
