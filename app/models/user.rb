class User < ApplicationRecord

  validates_uniqueness_of :name, :email

  validates :name, presence: true, length: { in: 2..32 }
  validates :password, presence: true, length: { in: 2..32 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :terms_of_service, acceptance: { message: 'must be abided' }

  # PASSWORD_FORMAT = /\A
  # (?=.{8,})          # Must contain 8 or more characters
  # (?=.*\d)           # Must contain a digit
  # (?=.*[a-z])        # Must contain a lower case character
  # (?=.*[A-Z])        # Must contain an upper case character
  # (?=.*[[:^alnum:]]) # Must contain a symbol
  # /x

  # validates :password, 
  #   presence: true, 
  #   length: { in: Devise.password_length }, 
  #   format: { with: PASSWORD_FORMAT }, 
  #   confirmation: true, 
  #   on: :create 

  # validates :password, 
  #   allow_nil: true, 
  #   length: { in: Devise.password_length }, 
  #   format: { with: PASSWORD_FORMAT }, 
  #   confirmation: true, 
  #   on: :update

  before_save :encrypt_password

  def encrypt_password
    if password.present?
      self.salts = SecureRandom.hex
      self.password = Digest::MD5.hexdigest(password + salts)
    end
  end
end
