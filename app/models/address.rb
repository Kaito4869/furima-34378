class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :zip_code
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :telephone_number
  end
end
