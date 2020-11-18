require 'digest'

class User < ApplicationRecord
  # rails active_storage:install enable storage
  has_one_attached :avatar

  attribute :role, :string, default: :user
  attribute :admin?, :boolean, default: false

  validates_uniqueness_of :name, :email
  validates :name, presence: true, length: {in: 2..32}
  validates :password, presence: true, length: {in: 2..32}
  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :terms_of_service, acceptance: {message: 'must be abided'}
  validate :avatar_type

  before_save :encrypt_password

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


  def encrypt_password
    return unless password.present?

    self.salts = SecureRandom.hex
    self.password = Digest::MD5.hexdigest(password + salts)
  end

  def avatar_type
    if avatar.attached? == false
      errors.add(:avatar, "is missing!")
    else
      unless avatar.content_type.in?(%('image/jpeg image/png image/jpg image/gif'))
        errors.add(:avatar, "needs to be a jpg/jpeg/png/gif")
      end
    end
  end
end
