class User < ActiveRecord::Base
  has_many :items

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, length: { minimum: 8}, on: :create

  has_secure_password
end
