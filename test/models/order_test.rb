require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'it should generate a GUID when saving' do
    order = orders(:valid_order).dup
    order.guid = nil
    order.save
    assert order.guid.present?, 'GUID was not generated when saving'
  end

  test 'it should be able to have many delivery_addresses' do
    order = orders :valid_order
    2.times do
      da = delivery_addresses(:valid_delivery_address).dup
      da.order_id = order.id
      da.save
    end

    assert_equal 2, order.delivery_addresses.size, 'Order does not have'\
                                                   'multiple delivery_addresses'
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
