FactoryBot.define do
  factory :interaction do
    type { "" }
    action { "MyString" }
    action_id { "MyString" }
    date_occured { "2019-11-15 10:52:01" }
    date_recorded { "2019-11-15 10:52:01" }
    source { "MyString" }
    person { nil }
  end
end
