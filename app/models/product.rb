class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  # validates :brand 
  # validates :categories
  # validates :categories
  # validates :types
  # validates :detail
end
