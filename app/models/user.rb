class User < ActiveRecord::Base
  has_secure_password
  #validates :email, presence: true

  has_many :donations
  has_many :requests
  has_many :creations
end
