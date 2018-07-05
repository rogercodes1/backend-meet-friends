class AddUrlToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :url, :string
    add_column :places, :searchTerm, :string
    add_column :places, :location, :string

  end
end
