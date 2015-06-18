class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, limit: 30, uniqueness: true
      t.string :password_digest, null: false
      t.text :about
      t.string :email, null: false, uniqueness: true
      t.integer :karma #might not do much with this now

      t.timestamps
    end
  end
end
