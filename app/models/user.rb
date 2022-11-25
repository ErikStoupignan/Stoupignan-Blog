class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true, allow_blank: false

  def recent_post
    posts.order('created_at Desc').limit(3)
  end
end
