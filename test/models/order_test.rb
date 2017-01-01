require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'it should generate a GUID when saving' do
    order = orders(:complete).dup
    order.guid = nil
    order.delivery_address = delivery_addresses :los_angeles
    order.save
    assert order.guid.present?, 'GUID was not generated when saving'
  end

  test 'it should belong to a delivery_addresses' do
    order = orders :complete
    assert_equal(
      order.delivery_address_id,
      delivery_addresses(:los_angeles).id,
      'Order does not belong to the correct delivery_address'
    )
  end

  test 'it should require a customer_id' do
    order = orders :complete
    order.customer_id = nil
    assert_not order.save, 'customer_id not required when it should be'
  end

  test 'it should require a user_id' do
    order = orders :complete
    order.user_id = nil
    assert_not order.save, 'user_id not required when it should be'
  end

  test '#status' do
    incomplete_order = orders :incomplete
    complete_order = orders :complete
    assert_equal(
      incomplete_order.status,
      'incomplete',
      'Incomplete order not returning incomplete'
    )
    assert_equal(
      complete_order.status,
      'complete',
      'Complete order not returning complete'
    )
  end
end
