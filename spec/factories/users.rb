# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:full_name) { |i| Faker::Name.name + i.to_s }
    sequence(:email) { |i| i.to_s + Faker::Internet.email }
    password { 'Password3' }
    password_confirmation { 'Password3' }
  end
end
