class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    @like = current_user.likes.new(like_params)
    if @like.save
      redirect_to post_path(@like.post.id)
    end
  end

  def destroy
    like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    if like.destroy
      redirect_to post_path(like.post.id)
    end
  end

  private
    def like_params
      params.permit(:user_id, :post_id)
    end
end
