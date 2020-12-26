class Post < ApplicationRecord
  validates :content, presence: true, length: {maximum: 140}

  belongs_to :user

  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy

end
