class User < ApplicationRecord

  validates_uniqueness_of :name, :email

  validates :name, presence: true, length: { in: 2..32 }
  validates :password, presence: true, length: { in: 2..32 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :terms_of_service, acceptance: { message: 'must be abided' }

  before_save :encrypt_password

  def authenticate(user, password)
    return true if user.password == Digest::MD5.hexdigest(password + user.salts)
    false
  end

  def encrypt_password
    if password.present?
      self.salts = SecureRandom.hex
      self.password = Digest::MD5.hexdigest(password + salts)
    end
  end
end
