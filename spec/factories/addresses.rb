FactoryBot.define do
  factory :address do
    cep { Faker::Address.zip_code }
    street { Faker::Address.street_address }
    complement { Faker::Address.secondary_address }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    ibge { Faker::Number.number(digits: 7) }
  end
end
