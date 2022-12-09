class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_total_comment
  after_destroy :update_total_comment

  def update_total_comment
    post.update(comments_counter: post.comments.all.length)
  end
end
