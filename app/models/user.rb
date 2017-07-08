class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_attached_file :photo
  validates_attachment :photo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
