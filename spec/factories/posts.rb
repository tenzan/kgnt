FactoryBot.define do
  factory :post do
    title { "MyString" }
    description { "MyText with some Detailed Information" }
    location { "MyString" }
    price { 1 }
    currency { "MyString" }
    phone { "MyString" }
    purpose { "MyString" }
    category { nil }
  end
end
