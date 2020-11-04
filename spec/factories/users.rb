FactoryBot.define do
  factory :user do
    nickname                 { 'sample' }
    email                    { 'sample@sample.com' }
    password                 { 'sample123' }
    password_confirmation    { 'sample123' }
    first_name               { '鈴木' }
    last_name                { '一朗' }
    first_name_kana          { 'スズキ' }
    last_name_kana           { 'イチロウ' }
    birth_date               { '1975-01-01' }
  end
end
