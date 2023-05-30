class User < ApplicationRecord
  has_secure_password

  enum :role, { Viewer: 0, Administrator: 1, Supervisor: 2, Manager: 3 }

  def has_role?(role)
    self.role.to_s.downcase == role.to_s
  end
end
