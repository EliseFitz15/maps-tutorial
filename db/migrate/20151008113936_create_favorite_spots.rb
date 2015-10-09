class CreateFavoriteSpots < ActiveRecord::Migration
  def change
    create_table :favorite_spots do |t|
      t.string :location_name, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.belongs_to :user, null: false
      t.string :address

      t.timestamps null: false
    end
  end
end
