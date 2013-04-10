class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  attr_accessible :user_id, :post_id

  validate :one_post_upvote_per_user

  def one_post_upvote_per_user
    unless Vote.where("user_id = ? AND post_id = ?", self.user_id, self.post_id).empty?
      errors[:base] << "Already voted for this post"
    end
  end
end
