class Item < ApplicationRecord
 
  with_options numericality: { other_than: 1, message: "can't be blank" } do
   validates :item_category_id
   validates :item_sales_status_id
   validates :item_shipping_fee_status_id
   validates :item_prefecture_id
   validates :item_scheduled_delivery_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_sales_status 
  belongs_to_active_hash  :item_shipping_fee_status
  belongs_to_active_hash  :item_prefecture
  belongs_to_active_hash  :item_scheduled_delivery
  belongs_to :user
  has_one_attached :image

  
  validates :image,                       presence: true
  validates :item_name,                   presence: true
  validates :item_info,                   presence: true
  validates :item_category_id,            numericality: { other_than: 1}
  validates :item_sales_status_id,        numericality: { other_than: 1}
  validates :item_shipping_fee_status_id, numericality: { other_than: 1}
  validates :item_prefecture_id,          numericality: { other_than: 1}
  validates :item_scheduled_delivery_id,  numericality: { other_than: 1}
  validates :item_price,                  presence: true, numericality: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
end