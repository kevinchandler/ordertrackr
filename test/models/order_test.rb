require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'it should generate a GUID when saving' do
    order = orders(:valid_order).dup
    order.guid = nil
    order.delivery_address = delivery_addresses :valid_delivery_address
    order.save
    assert order.guid.present?, 'GUID was not generated when saving'
  end

  test 'it should belong to a delivery_addresses' do
    order = orders :valid_order
    assert_equal(
      order.delivery_address_id,
      delivery_addresses(:valid_delivery_address).id,
      'Order does not belong to the correct delivery_address'
    )
  end

  test 'it should require a customer_id' do
    order = orders :valid_order
    order.customer_id = nil
    assert_not order.save, 'customer_id not required when it should be'
  end

  test 'it should require a user_id' do
    order = orders :valid_order
    order.user_id = nil
    assert_not order.save, 'user_id not required when it should be'
  end
end
