class Post < ApplicationRecord
  validates :content, presence: true, length: {maximum: 140}

  belongs_to :user

  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy

  has_many :comments, dependent: :destroy

  def liked_by(user)
    # user_idとpost_idが一致するlikeを検索する
    Like.find_by(user_id: user.id, post_id: id)
  end
end
