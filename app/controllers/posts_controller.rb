class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @psot = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_index_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  private
    def post_params
      params.permit(:content)
    end
end
