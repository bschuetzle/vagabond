class User < ApplicationRecord
  has_many :locations through: :user_location
end
