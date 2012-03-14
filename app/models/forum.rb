class Forum < ActiveRecord::Base
  attr_accessible :content , :title 
  has_many :comments
  belongs_to :user
  validates :user_id , presence: true 
  validates :title , presence: true 
  validates :content , presence: true

  default_scope order: 'forums.created_at DESC'
end
# == Schema Information
#
# Table name: forums
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

