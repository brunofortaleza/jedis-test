FactoryBot.define do
  factory :user do
    full_name { Faker::Name.name }
    cpf { '44229329008' }
    cns { Faker::Number.number(digits: 15) }
    email { Faker::Internet.email }
    birth_date { Date.today.strftime('%d/%m/%Y') }
    phone_number { Faker::PhoneNumber.cell_phone }
    status { 1 }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'user_image.jpg'), 'image/jpeg') }

    association :address, factory: :address
  end
end
