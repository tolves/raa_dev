class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  belongs_to :brand
  belongs_to :category

  # belongs_to :brand  add_reference :products, :brand t.belongs_to :author

  # has_many :price
end
