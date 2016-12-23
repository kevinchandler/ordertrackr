require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test 'it should require an address' do
    customer = customers :valid_customer
    customer.address = nil
    assert_not customer.save, 'customer address not required when it should be'
  end

  test 'it should require a zipcode' do
    customer = customers :valid_customer
    customer.zipcode = nil
    assert_not customer.save, 'customer zipcode not required when it should be'
  end

  test 'it should standardize the phone when saving' do
    customer = customers :valid_customer
    customer.phone = '13404053188fff'
    customer.save
    assert_equal '3404053188', customer.phone, 'customer phone not standardized'
  end
end
