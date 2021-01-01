class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post, only: [:create, :destroy]

  def create
    @like = current_user.likes.new(like_params)
    @like.save
    respond_to :js
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    respond_to :js
  end

  private
    def like_params
      params.permit(:user_id, :post_id)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end
