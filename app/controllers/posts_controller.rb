class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = if params[:content_key]
               Post.where('content LIKE ?', "%#{params[:content_key]}%").order(created_at: :desc)
             else
               Post.includes(:user).order(created_at: :desc)
             end
  end

  def new
    @post = PostsTag.new
  end

  def create
    @post = PostsTag.new(post_params)
    if @post.valid?
      @post.save
      flash[:notice] = '投稿を作成しました'
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @tags = @post.tags
    @user = @post.user
    @like = @post.likes
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
  end

  def update
    if @post.update(update_params)
      @post.save
      flash[:notice] = '投稿を編集しました'
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    if @post.user.id == current_user.id
      @post.destroy
      flash[:notice] = '投稿を削除しました'
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  def search
    return nil if params[:keyword] == ''

    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"])
    render json: { keyword: tag }
  end

  private

  def post_params
    params.require(:posts_tag).permit(:content, :tag_name).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
