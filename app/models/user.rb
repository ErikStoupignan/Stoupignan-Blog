class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  validates :photo, uniqueness: true
  validates :bio, presence: true
  validates :name, presence: true

  def recent_post
    posts.order('created_at Desc').limit(3)
  end
end
