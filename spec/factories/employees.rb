# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    sequence(:name) { |i| Faker::Name.name + i.to_s }
    sequence(:document) { Faker::IdNumber.brazilian_id(formatted: true) }
    sequence(:address) { Faker::Address.street_address }
    sequence(:address_city) { Faker::Address.city }
    sequence(:address_state) { Faker::Address.state }
    sequence(:phone_number) { Faker::PhoneNumber.cell_phone }
    sequence(:salary) { rand(1400...10_000) }
  end
end
