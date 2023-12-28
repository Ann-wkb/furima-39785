class OrderForm < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :city, :street_address, :building_name, :phone_number

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}
  validates :city, presence: true
  validates :street_address, presence: true
  validates :building, presence: true  
  validates :phone_number, format: { with: /\A0[0-9]+\z/, message: 'number is invalid. Include half-width numbers' } 
  validates :user_id
  validates :item_id
  
  belongs_to :order
end
