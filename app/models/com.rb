class Com < ActiveRecord::Base
attr_accessible :comments ,:micropost_id
belongs_to :micropost
belongs_to :user
validates :comments ,presence: true 
validates :user_id ,presence: true
  default_scope order: 'coms.created_at DESC'
end
# == Schema Information
#
# Table name: coms
#
#  id           :integer         not null, primary key
#  comments     :text
#  micropost_id :integer
#  user_id      :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

