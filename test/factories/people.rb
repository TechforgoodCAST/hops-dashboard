FactoryBot.define do
  factory :person do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    region { nil }
    organisation { nil }
    airtable_record { "MyString" }
  end
end
