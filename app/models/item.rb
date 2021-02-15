class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :fee_id, presence: true
  validates :area_id, presence: true
  validates :date_id, presence: true
  validates :price, presence: true
end
