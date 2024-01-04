class OrderForm < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :city, :street_address, :building_name, :phone_number
  attr_accessor :token
  
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}
  validates :city, presence: true
  validates :street_address, presence: true
  validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid. Enter a 10 to 11 digit number without hyphens' }
  #validates :user_id
  #validates :item_id
  #validates :token
  
  belongs_to :order
end
