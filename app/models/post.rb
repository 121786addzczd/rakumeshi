class Post < ApplicationRecord

  belongs_to :user

  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :post_tag_relations, dependent: :destroy

  has_many :tags, through: :post_tag_relations, source: :tag

  def liked_by(user)
    # user_idとpost_idが一致するlikeを検索する
    Like.find_by(user_id: user.id, post_id: id)
  end
end
