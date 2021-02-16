class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :fee
  belongs_to :area
  belongs_to :item_date

  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :state_id, numericality: { other_than: 1 }
    validates :fee_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :item_date_id, numericality: { other_than: 1 }
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  end
end