class Creation < ActiveRecord::Base
  belongs_to :user
  validates :title, :description, :image_url, :directions, :tags, presence: true
end
