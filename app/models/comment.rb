class Comment < ActiveRecord::Base
  attr_accessible :content , :forum_id 
  belongs_to :forum
  belongs_to :user
  validates :content  , presence: true 
  validates :user_id , presence: true 

  default_scope order: 'comments.created_at DESC'
end
# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  content    :text
#  user_id    :integer
#  forum_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

