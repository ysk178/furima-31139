class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :day

  belongs_to :user
  has_one :record
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :prefecture_id
    validates :days_id
    validates :price, format: { with: /\A-?[0-9]+(\.[0-9]+)?\z/ }
  end
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :prefecture_id
    validates :days_id
  end

  validates :price, inclusion: { in: 300..9_999_999 }
end