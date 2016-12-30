require 'test_helper'

class DeliveryAddressTest < ActiveSupport::TestCase
  test 'it should require a street_address' do
    delivery_address = delivery_addresses :valid_delivery_address
    delivery_address.street_address = nil
    assert_not delivery_address.save, 'delivery_address street_address not required when it should be'
  end

  test 'it should require a zipcode' do
    delivery_address = delivery_addresses :valid_delivery_address
    delivery_address.zipcode = nil
    assert_not delivery_address.save, 'customer zipcode not required when it should be'
  end
end
