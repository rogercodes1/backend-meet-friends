class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :event_id, null:false
      t.integer :user_id 
      t.string :comment, null:false
      t.timestamps
    end
  end
end
