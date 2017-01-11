if Rails.env.production?
  raise 'Database cannot be seeded in production environment'
end

require 'faker'
I18n.reload!

[Agent, Driver, Customer, Order, DeliveryAddress, Business].each do |model|
  model.delete_all
end

business = Business.create!(
  name: 'Bobs Burgers',
  phone: '1234567890',
  street_address: '1322 3rd Street Promenade',
  city: 'Santa Monica',
  state: 'CA',
  zipcode: '90401'
  # rely on geocoding for coords
)

agent = Agent.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: 'password',
  password_confirmation: 'password',
  business: business
)

driver = Driver.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: Faker::Internet.password,
  business: business
)

customer = Customer.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  phone: '1234567890',
  business: business
)

delivery_address = DeliveryAddress.create!(
  street_address: '829 Broadway',
  city: 'Santa Monica',
  state: 'CA',
  zipcode: '90401',
  # rely on geocoding for coords
)

order = Order.create!(
  agent_id: agent.id,
  driver_id: driver.id,
  customer_id: customer.id,
  delivery_address_id: delivery_address.id,
  complete: false,
  business: business
)
