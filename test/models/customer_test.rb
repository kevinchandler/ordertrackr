require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test 'it should standardize the phone when saving' do
    customer = customers :valid_customer
    customer.phone = '13404053188fff'
    customer.save
    assert_equal '3404053188', customer.phone, 'customer phone not standardized'
  end
end
