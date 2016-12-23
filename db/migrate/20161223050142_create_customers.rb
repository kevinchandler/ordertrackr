class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone, length: 10
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
