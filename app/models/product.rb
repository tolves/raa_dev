class Product < ApplicationRecord
  validates :name, presence: true, length: {minimum: 2}, uniqueness: {scope: :brand_id, message: 'One brand should have one unique product'}
  belongs_to :brand
  belongs_to :category
  has_many :prices

  # belongs_to :brand
  # add_reference :products, :brand
  # t.belongs_to :author
end
