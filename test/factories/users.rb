# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    full_name { 'John Doe' }
    sequence(:email) { |n| "email#{n}@example.com" }
    password { 'passw0rd' }
  end
end
