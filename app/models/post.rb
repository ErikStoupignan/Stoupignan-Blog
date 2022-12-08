class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :post_id, dependent: :delete_all
  has_many :likes, foreign_key: :post_id, dependent: :delete_all

  after_save :update_total_posts

  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_five_comments
    comments.includes(:author).order(created_at: :desc).limit(5)
  end

  private

  def update_total_posts
    author.update(posts_counter: author.posts.all.length)
  end
end
