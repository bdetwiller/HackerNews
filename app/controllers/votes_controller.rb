class VotesController < ApplicationController

  def create
    @vote = Vote.create(params[:vote])
    # if @vote.save
    #   Posts.find(params[:vote][:post_id]).points += 1
    # end
    redirect_to posts_url
  end
end
