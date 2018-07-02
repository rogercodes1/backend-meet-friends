class AddYelpUrlToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :yelp_url, :string
    add_column :events, :maps_link, :string



  end
end
