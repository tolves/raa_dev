class ApplicationRecord < ActiveRecord::Base

  self.abstract_class = true

  def authenticate(password)

    return true if self.password == Digest::MD5.hexdigest(password + salts)

    false
  end

end
