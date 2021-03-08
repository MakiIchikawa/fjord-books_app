# frozen_string_literal: true

FactoryBot.define do
  factory :alice, class: User do
    name { 'alice' }
    email { 'alice@example.com' }
    password { 'password' }
  end

  factory :bob, class: User do
    name { 'bob' }
    email { 'bob@example.com' }
    password { 'password' }
    provider { 'github' }
    uid { '1' }
  end
end
