FactoryBot.define do
  factory :item do
    name                 { 'sample' }
    explanation          { 'sample' }
    category_id          { '2' }
    status_id            { '2' }
    charge_id            { '2' }
    prefecture_id        { '2' }
    days_id              { '2' }
    price                { '500' }
    association :user
  end
end
