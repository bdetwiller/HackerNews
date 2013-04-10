# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  post_id    :integer
#  parent_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :body, :post_id, :parent_id
  belongs_to :post
  belongs_to :parent, :class_name => Comment
  belongs_to :user

  has_many :comments, :foreign_key => "parent_id"
end
