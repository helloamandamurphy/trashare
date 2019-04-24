class Supply < ActiveRecord::Base
  belongs_to :user
  validates :description, :tags, presence: true
end
