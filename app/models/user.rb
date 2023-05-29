class User < ApplicationRecord
  has_secure_password

  enum :role, { Viewer: 0, Administrator: 1, Supervisor: 2, Manager: 3 }
end
