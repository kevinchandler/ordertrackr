require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'it should generate a GUID when saving' do
    order = orders(:valid_order)
    order.guid = nil
    order.save
    assert order.guid.present?, 'GUID was not generated when saving'
  end

  test 'it should require a customer_id' do
    order = orders(:valid_order)
    order.customer_id = nil
    assert_not order.save, 'customer_id present when it should not be'
  end

  test 'it should require a user_id' do
    order = orders(:valid_order)
    order.user_id = nil
    assert_not order.save, 'user_id present when it should not be'
  end
end
