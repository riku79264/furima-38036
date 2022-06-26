class PurchaseAddress

 include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :city_name, :street_number, :building_name, :phone_number, :item_id, :user_id, :token

 
  

  with_options presence: true do
    validates :token, presence: true
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ , message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :shipping_area_id, numericality: { other_than: 1 ,message: "can't be blank" }
    validates :city_name
    validates :street_number
    validates :phone_number, format: {with: /\A[0-9]{11}\z/ ,message: "Phone number is too short"}
    validates :item_id
    validates :user_id
  end
  
    validates :phone_number, numericality: { with: /\A[0-9]{11}\z/ , message: "Half-width number" }

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)

    Address.create(post_code: post_code, shipping_area_id: shipping_area_id, city_name: city_name, street_number: street_number, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
    
  end

end