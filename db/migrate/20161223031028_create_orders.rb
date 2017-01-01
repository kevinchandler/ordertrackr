class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :guid
      t.references :user
      t.references :driver
      t.references :customer
      t.boolean :complete, default: false
      t.timestamps
    end
  end
end
