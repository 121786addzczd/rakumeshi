class UsersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_user, only: [:show, :edit, :update, :likes, :follows, :followers]

  def index
    @users = User.all
  end

  def show
  end

  def edit
    redirect_to user_path if @user.id != current_user.id
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'ユーザー情報を更新しました'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  # whereメソッドを用いてユーザーに関するデータをlikesテーブルから取得し、変数@likesに代入
  # 変数@userに紐づくLikeデータを取得
  def likes
    @likes = Like.where(user_id: @user.id)
  end

  def follows
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:email, :nickname, :image, :self_introduction)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
