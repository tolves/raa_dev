class Price < ApplicationRecord
  # validates :price, format: { with: /\d*/, message: "only allows numbers" }
  validates :price, presence: true, format: {with: /\d+/, message: 'only allows numbers'}
  validates :seller, presence: true
  validates :link, presence: true, format: {with: %r{\A(http|https)://}, message: 'Link format should start with http/https'}
  before_save :price_format

  def price_format
    self.price = if self.price_was.nil?
                   [{updated_at: Time.now, price: price}]
                 else
                   self.price_was + [{updated_at: Time.now, price: price}]
                 end
  end
end