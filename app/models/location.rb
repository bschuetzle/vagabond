class Location < ApplicationRecord
  has_many :posts
  has_attached_file :photo, styles: { original: ["1000x500#", :jpg] }
  validates_attachment :photo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  geocoded_by :address, :latitude  => :lat, :longitude => :long
  after_validation :geocode

  def address
    [city, state, country].compact.join(', ')
  end

  extend FriendlyId
  friendly_id :city, use: :slugged

  private

  def should_generate_new_friendly_id?
    slug.nil? || city_changed?
  end

end
