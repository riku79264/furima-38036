class Item < ApplicationRecord
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :shipping_area_id
    validates :delivery_day_id
  end
  with_options presence: true do
    validates :name
    validates :image
    validates :explain
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
  end
  validates :price, numericality: { with: /\A[0-9]+\z/, message: "Half-width number" }
 


  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :shipping_area
  belongs_to :delivery_day
end


