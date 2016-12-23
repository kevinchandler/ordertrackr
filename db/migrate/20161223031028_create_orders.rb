class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :guid
      t.references :user, null: false
      t.references :driver
      t.references :customer, null: false
      t.boolean :complete, default: false
      t.timestamps
    end
  end
end
