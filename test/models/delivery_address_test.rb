require 'test_helper'

class DeliveryAddressTest < ActiveSupport::TestCase
  test 'it should require a street_address' do
    delivery_address = delivery_addresses :los_angeles
    delivery_address.street_address = nil
    assert_not(
      delivery_address.save,
      'delivery_address street_address not required when it should be'
    )
  end

  test 'it should require a zipcode' do
    delivery_address = delivery_addresses :los_angeles
    delivery_address.zipcode = nil
    assert_not delivery_address.save, 'customer zipcode not required when it should be'
  end

  test '#coordinates' do
    delivery_address = delivery_addresses :los_angeles
    assert_equal(
      delivery_address.coordinates,
      '34.0522,-118.2437',
      'Delivery address coordinates not correct'
    )
  end
end
