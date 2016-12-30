class CreateDeliveryAddresses < ActiveRecord::Migration[5.0]
  def up
    change_table :customers do |t|
      t.remove :street_address
      t.remove :city
      t.remove :state
      t.remove :zipcode
      t.remove :latitude
      t.remove :longitude
    end

    create_table :delivery_addresses do |t|
      t.references :order
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end

  def down
    drop_table :delivery_addresses

    change_table :customers do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.float :latitude
      t.float :longitude
    end
  end
end
