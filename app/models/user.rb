class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  # has_attached_file :photo, styles: { profile: ["100x100#", :jpg] }, default_url: ActionController::Base.helpers.asset_path("skrillicon.jpeg", :digest => false)
  has_attached_file :photo, styles: { profile: ["150x150#", :jpeg] }, default_url: "/images/:style/skrillicon.jpg"
  validates_attachment :photo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create

  def self.confirm(params)
    @user = User.friendly.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end

  extend FriendlyId
  friendly_id :name, use: :slugged

  private

  def should_generate_new_friendly_id?
    slug.nil? || name_changed?
  end

end
