FactoryBot.define do
  factory :post do
    title { "MyString" }
    description { "MyText" }
    location { "MyString" }
    price { 1 }
    currency { "MyString" }
    phone { "MyString" }
    purpose { "MyString" }
    category { nil }
  end
end
