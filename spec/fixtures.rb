require 'rails_helper'

FactoryBot.define do
  factory :unactivated_user, class: User do
    email { 'unactivated_user@example.com' }
    password { 'password' }
  end

  factory :activated_user, class: User do
    email { 'activated_user@example.com' }
    password { 'password' }
    activated_at { 1.days.ago }
  end

  factory :bookmark do
    association :user, factory: :activated_user
    title { 'hoge' }
    url { 'https://example.com' }
  end
end