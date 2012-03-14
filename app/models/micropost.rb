class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  has_many :coms 

  validates :user_id , presence: true
  validates :content , presence: true , length: { maximum: 140 }
 # default_scope order: 'microposts.created_at DESC'
#default_scope order: 'coms.created_at DESC'
end
# == Schema Information
#
# Table name: microposts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

