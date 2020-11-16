class Admin < ApplicationRecord
  attribute :role
  attribute :is_admin?
  validates :name, presence: true, length: { in: 2..32 }
  validates :password, presence: true, length: { in: 2..32 }

  def role
    :admin
  end

  def is_admin?
    true
  end
end