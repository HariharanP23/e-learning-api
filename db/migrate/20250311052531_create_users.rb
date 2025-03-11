class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :role, null: false
      t.string :active, default: 'active'
      t.timestamps
    end
  end
end
