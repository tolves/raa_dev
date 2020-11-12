class User < ApplicationRecord
  def authenticate(user, password)
    return true if user.password = Digest::MD5.hexdigest(password + user.salts)
    false
  end
end
