# frozen_string_literal: true

FactoryBot.define do
  factory :bicycle do
    model       { Faker::Vehicle.version  }
    color       { Faker::Vehicle.color  }
    price       { Faker::Commerce.price(range: 0..300.0, as_string: true) }
    style       { ['off-road', 'kids-bike', 'electric-bike'].sample }
    description { 'This is a fake description for a fake bike which can run faster than a nigga seen around by the cops selling weed.' }

    trait :with_image do
      after :create do |bicycle|
        file_name = 'bike.jpg'
        file_path = Rails.root.join('spec', 'fixtures', file_name)
        bicycle.image.attach(io: File.open(file_path), filename: file_name)
      end
    end
  end
end
