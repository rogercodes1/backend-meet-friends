class AddYelpImageToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :yelp_image, :string
  end
end
