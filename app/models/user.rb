class User < ActiveRecord::Base
  has_many :todos
  has_secure_password
  # validates :name, :login, :email, presence: true
end
