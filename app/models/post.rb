class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_total_posts

  validates :author, presence: true
  validates :title, presence: true
  validates :text, presence: true

  def last_five_comments
    comments.last(5)
  end

  private
  def update_total_posts
    author.update(posts_counter: author.posts.all.length)
  end

end
