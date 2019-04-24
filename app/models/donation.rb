class Donation < ActiveRecord::Base
  belongs_to :user
  validates :title, :description, :image_url, :address, :tags, presence: true
end
