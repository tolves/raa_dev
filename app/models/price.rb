class Price < ApplicationRecord
  # validates :price, format: { with: /\d*/, message: "only allows numbers" }
  validates :price, presence: true, format: {with: /\d+/, message: 'only allows numbers'}
  validates :seller, presence: true
  validates :link, presence: true, format: {with: %r{\A(http|https)://}, message: 'Link format should start with http/https'}


  before_save :price_format

  def price_format
    if price.present?
      self.price = {Time.now => price}
    end
  end
end