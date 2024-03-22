class Product < ApplicationRecord
  belongs_to :category
  has_many :inventory, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :product_reviews, dependent: :destroy
  has_many :discounted_products, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :price, presence: true
  validates :image, presence: true
  validate :validate_image_urls

  private

  def validate_image_urls
    errors.add(:images, 'must have valid URLs') unless images.all? { |url| url =- URI::DEFAULT_PARSER.make_regexp }
  end
end
