class Admin < ApplicationRecord
  attribute :role, :string, default: :admin
  attribute :admin?, :boolean, default: true
  validates :name, presence: true, length: {in: 2..32}
  validates :password, presence: true, length: {in: 2..32}
end