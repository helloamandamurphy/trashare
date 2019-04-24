class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false, message: "This email is associated with an existing account; please log in." }
  validates :username, uniqueness: { case_sensitive: false, message: "This username is unavailable."}
  validates :first_name, :last_name, :user_image, :email, :username, :password, presence: true

  has_many :donations
  has_many :supplies
  has_many :creations
end
