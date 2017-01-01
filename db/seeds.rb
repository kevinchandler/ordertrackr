require 'faker'
if Rails.env.production?
  raise 'Database cannot be seeded in production environment'
end

Customer.delete_all
Order.delete_all
DeliveryAddress.delete_all

customer = Customer.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  phone: '1234567890'
)

delivery_address = DeliveryAddress.create!(
  street_address: Faker::Address.street_address,
  city: Faker::Address.city,
  state: Faker::Address.state,
  zipcode: Faker::Address.zip,
  latitude: Faker::Address.latitude,
  longitude: Faker::Address.longitude
)

# TODO: seed agent and driver once models are created, update ids below
order = Order.create!(
  agent_id: 1,
  driver_id: 1,
  customer_id: customer.id,
  delivery_address_id: delivery_address.id,
  complete: false,
)
