class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_name, null:false
      t.string :location_name, null:false
      t.string :address, null:false
      t.string :description, null:false
      t.date :date, null:false
      t.string :time, null:false
      t.float :duration, null:false
      t.integer :friends, null:false, default: 3

      t.timestamps
    end
  end
end
