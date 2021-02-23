class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :area_id, :city, :address, :building_name, :telephone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :telephone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :token
    validates :user_id
    validates :item_id
  end

  def save

    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, area_id: area_id, city: city, address: address, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end

end
