class Location < ApplicationRecord
  has_many :posts
  has_attached_file :photo, styles: { original: ["1000x500#", :jpg] }
  validates_attachment :photo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  geocoded_by :address, :latitude  => :lat, :longitude => :long
  after_validation :geocode

  def address
    [city, state, region].compact.join(', ')
  end
end
