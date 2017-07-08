class Location < ApplicationRecord
  has_many :posts
  has_attached_file :photo, styles: { original: ["2000x500#", :jpg] }
  validates_attachment :photo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
