class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.string :initials
      t.string :email, unique: true, null:false
      t.string :password_digest, null:false
      t.date :birthday, null:false
      t.string :gender, null:false
      t.string :avatar
      t.string :home_base

      t.timestamps
    end
  end
end
