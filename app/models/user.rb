class User < ActiveRecord::Base
  has_many :chores
  has_secure_password
  # validates :name, :login, :email, presence: true
end
