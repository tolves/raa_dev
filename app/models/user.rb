class User < ApplicationRecord
  attr_accessor :terms_of_service

  validates_uniqueness_of :name
  validates :name, presence: :true
  validates :password, presence: :true
  validates :terms_of_service, acceptance: { message: 'must be abided' }


  def authenticate(user, password)
    return true if user.password == Digest::MD5.hexdigest(password + user.salts)
    false
  end
end
