class AddDeliveryAddressIdToOrders < ActiveRecord::Migration[5.0]
  def up
    remove_column :delivery_addresses, :order_id
    add_column :orders, :delivery_address_id, :integer
  end

  def down
    add_column :delivery_addresses, :order_id, :integer
    remove_column :orders, :delivery_address_id
  end
end
