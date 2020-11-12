require 'digest'

module UsersHelper
  def hash_password(origin_password)
    random = SecureRandom.hex
    [Digest::MD5.hexdigest(origin_password + random), random]
  end
end
