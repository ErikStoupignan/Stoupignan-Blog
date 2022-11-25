class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_total_likes

  def update_total_likes
    post.update(like_counter: post.likes.all.length)
  end
end
