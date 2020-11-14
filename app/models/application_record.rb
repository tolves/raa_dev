class ApplicationRecord < ActiveRecord::Base

  self.abstract_class = true

  def authenticate(password)
    return true if self.password == Digest::MD5.hexdigest(password + self.salts)
    false
  end

end
