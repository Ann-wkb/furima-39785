class Item < ApplicationRecord
  belongs_to :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date
  has_one_attached :images
  #devise :database_authenticatable, :registerable,
   #      :recoverable, :rememberable, :validatable
  validates :images, presence: true
  validates :price, presence: true, format: {with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: " Out of setting range"}
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :category_id, presence: true, numericality: { other_than: 0, message: 'Select' }
  validates :item_title, presence: true
  validates :item_description, presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date_id, presence: true
  
  

end
