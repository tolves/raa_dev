class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  # validates :brand 
  # validates :categories
  # validates :categories
  # validates :types
  # validates :detail

  # belongs_to :brand  add_reference :products, :brand t.belongs_to :author
  # belongs_to :category
  # has_many :price
end
