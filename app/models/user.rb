class User < ApplicationRecord
  has_secure_password

  enum :role, { viewer: 0, administrator: 1, supervisor: 2, manager: 3 }

  def has_role?(role)
    self.role.to_s.downcase == role.to_s
  end
end
