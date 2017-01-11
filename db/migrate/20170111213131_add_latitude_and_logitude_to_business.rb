class AddLatitudeAndLogitudeToBusiness < ActiveRecord::Migration[5.0]
  def change
    change_table :businesses do |t|
      t.float :latitude
      t.float :longitude
    end
  end
end
