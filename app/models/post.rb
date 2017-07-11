class Post < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :body, presence: true, length: {minimum: 1, maximum: 200}

  extend FriendlyId
  friendly_id :title, use: :slugged
end
