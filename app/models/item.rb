class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase
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
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is invalid' }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :fee_id
      validates :area_id
      validates :item_date_id
    end
  end
end
