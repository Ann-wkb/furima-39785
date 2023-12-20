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
  has_one_attached :image
  # devise :database_authenticatable, :registerable,
  #      :recoverable, :rememberable, :validatable
  validates :image, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' },
                    format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
  validates :category_id, presence: true, numericality: { other_than: 0, message: 'Select' }
  validates :item_title, presence: true
  validates :item_description, presence: true
  validates :condition_id, presence: true, numericality: { other_than: 0, message: 'Select' }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 0, message: 'Select' }
  validates :prefecture_id, presence: true, numericality: { other_than: 0, message: 'Select' }
  validates :shipping_date_id, presence: true, numericality: { other_than: 0, message: 'Select' }

  def ordered?
    # 注文があるかどうかを判定するロジックを追加
    # 例として、関連する Order モデルが存在するかどうかで判定する場合
    orders.exists?
  end

  
end
