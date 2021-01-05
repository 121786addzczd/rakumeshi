class PostsTag
  include ActiveModel::Model
  attr_accessor :content, :tag_name, :user_id

  with_options presence: true do
    validates :content, length: { maximum: 1000 }
    validates :tag_name
  end

  def save
    post = Post.create(content: content, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    PostTagRelation.create(post_id: post.id, tag_id: tag.id)
  end

end
