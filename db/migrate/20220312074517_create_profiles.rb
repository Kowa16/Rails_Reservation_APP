class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.string :name
      t.timestamps null: false
    end


    create_table :profiles do |t|
      t.belongs_to :user
      t.string :profile_name
      t.string :self_introduction
      t.timestamps
    end
  end
end
