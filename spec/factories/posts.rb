FactoryBot.define do
  factory :post do
    title { "MyTitle" }
    description { "MyText with some Detailed Information" }
    location { "MyLocation" }
    price { 1 }
    currency { "MyCurrency" }
    phone { "MyString" }
    purpose { "MyString" }
    category { nil }
  end
end
