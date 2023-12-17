class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :images, presence: true
  validates :id, presence: true
  validates :price, presence: true, format: {with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  validates :price, presence: true,numericality: {only_integer: true, greater_than_or_equal_to: 300, message: " must be greater than or equal to 300"}
  validates :item_title, presence: true
  validates :item_description, presence: true
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date_id, presence: true
  validates :create_id, presence: true
  validates :update_id, presence: true
  
end
