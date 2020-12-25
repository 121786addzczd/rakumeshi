class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to posts_index_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to posts_index_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_index_path
  end


  private
    def post_params
      params.require(:post).permit(:content)
    end

    def set_post
      @post = Post.find(params[:id])
    end

end
