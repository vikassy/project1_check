# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  profession      :string(255)
#  qualification   :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base

attr_accessible :name , :email , :profession , :qualification , :password , :password_confirmation 
has_secure_password
has_many :microposts , dependent: :destroy 
before_save :create_remember_token

correct_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates :name  ,    presence: true ,
                      length: {maximum: 50}
validates :email ,    presence: true ,
		      format: {with: correct_email},
		      uniqueness: {case_sensitive: false }
validates :password , presence: true ,
		      length: {minimum: 6}

  def create_remember_token 
    self.remember_token = SecureRandom.urlsafe_base64
  end
  def feed
    # This is preliminary. See "Following users" for the full implementation.
    microposts
  end



end

