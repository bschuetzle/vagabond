class Location < ApplicationRecord
  belongs_to :user though: :user_location
end
