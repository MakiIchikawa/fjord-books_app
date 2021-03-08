# frozen_string_literal: true

FactoryBot.define do
  factory :report do
    factory :feeling, class: Report do
      title { '今日の気分' }
      content { '最高' }

      association :user, factory: :alice
    end
  end
end
