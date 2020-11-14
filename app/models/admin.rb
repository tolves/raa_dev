class Admin < ApplicationRecord
  validates :name, presence: true, length: { in: 2..32 }
  validates :password, presence: true, length: { in: 2..32 }
end