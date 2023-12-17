class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  has_many_attached :images
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :user, optional: true
  has_one :buy
  has_one_attached :image


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :images, presence: true
  validates :id, presence: true
  validates :price, presence: true, format: {with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: " Out of setting range"}
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :category_id, presence: true, numericality: { other_than: 0, message: 'Select' }
  validates :item_title, presence: true
  validates :item_description, presence: true
  validates :user_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date_id, presence: true
  validates :create_id, presence: true
  validates :update_id, presence: true
  
  def images_presence
    if images.attached?
      if images.blank? || images.length < 1
        errors.add(:images, '少なくとも1枚の画像を投稿してください')
      end
    else
      errors.add(:image, '画像がありません')
    end
  end
end
