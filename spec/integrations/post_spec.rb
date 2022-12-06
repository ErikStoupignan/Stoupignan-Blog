require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
  describe 'Post' do
    before(:each) do
      @user1 = User.create(name: 'John', photo: 'https://picsum.photos/seed/picsum/536/354', bio: 'bio')
      @user1.save!
      visit root_path
      @post1 = Post.create(title: 'First Post', text: 'This is my first post', likes_counter: 3, author: @user1)
      @post2 = Post.create(title: 'Second Post', text: 'This is my second post', author: @user1)
      @post3 = Post.create(title: 'Third Post', text: 'This is my third post', author: @user1)
      @comment1 = Comment.create(text: 'Comment first', author: User.first, post: @post1)
      @comment2 = Comment.create(text: 'Comment another', author: User.first, post: @post1)
      @comment3 = Comment.create(text: 'Comment new', author: User.first, post: @post1)
    end

    it "shows user's profile picture" do
      visit(user_posts_path(@user1.id))
      expect(page).to have_css('img[src*="https://picsum.photos/seed/picsum/536/354"]')
    end

    it 'shows the users username' do
      visit(user_posts_path(@user1.id))
      expect(page).to have_content('John')
    end

    it 'shows number of posts of user has written' do
      visit(user_posts_path(@user1.id))
      expect(@user1.posts_counter).to eql(3)
    end

    it 'shows number of posts by user' do
      visit(user_posts_path(@user1.id))
      expect(page).to have_content('posts: 3')
    end

    it 'shows posts title' do
      visit(user_posts_path(@user1.id))
      expect(page).to have_content('Index Posts')
    end

    it 'can see some of the post detail' do
      visit(user_posts_path(@user1.id))
      expect(page).to have_content('This is my first post')
    end

    it 'can see the first comment on a post' do
      visit(user_posts_path(@user1.id))
      expect(page).to have_content('Comment first')
    end

    it 'can see how many comments a post has.' do
      visit(user_posts_path(@user1.id))
      expect(page).to have_content('Comments: 3')
    end

    it 'can see how many likes a post has.' do
      visit(user_posts_path(@user1.id))
      expect(page).to have_content('Likes: 3')
    end

    it 'can see a section for pagination if there are more posts than fit on the view' do
      visit(user_posts_path(@user1.id))
      click_link 'Pagination'
      expect(page).to have_current_path new_user_post_path(@user1.id)
    end

    it "When I click on a post, it redirects me to that post's show page" do
      visit(user_posts_path(@user1.id))
      click_link 'Post: 1'
      expect(page).to have_current_path user_post_path(@user1.id, @post1)
    end
  end
end

RSpec.describe 'Post show', type: :feature do
  describe 'Post' do
    before(:each) do
      @user1 = User.create(name: 'Carlos', photo: 'https://picsum.photos/seed/picsum/536/354', bio: 'bio')
      @user1.save!
      @user2 = User.create(name: 'Luis', photo: 'https://picsum.photos/seed/picsum/536/354', bio: 'bio')
      @user3 = User.create(name: 'Lorena', photo: 'https://picsum.photos/seed/picsum/536/354', bio: 'bio')
      @user4 = User.create(name: 'Jesús', photo: 'https://picsum.photos/seed/picsum/536/354', bio: 'bio')
      visit root_path
      @post1 = Post.create(title: 'First Post', text: 'This is my first post', likes_counter: 3, author: @user1)
      @post2 = Post.create(title: 'Second Post', text: 'This is my second post', author: @user1)
      @post3 = Post.create(title: 'Third Post', text: 'This is my third post', author: @user1)
      @comment1 = Comment.create(text: 'Comment first', author: @user2, post: @post1)
      @comment2 = Comment.create(text: 'Comment another', author: @user3, post: @post1)
      @comment3 = Comment.create(text: 'Comment new', author: @user4, post: @post1)
      visit user_post_path(@user1, @post1)
    end

    it 'shows posts title' do
      expect(page).to have_content('First Post')
    end

    it 'shows the person who wrote the post' do
      expect(page).to have_content('Carlos')
    end

    it 'shows number of comments' do
      expect(page).to have_content('Comments: 3')
    end

    it 'shows number of likes' do
      expect(page).to have_content('Likes: 3')
    end

    it 'can see the post\'s body.' do
      expect(page).to have_content('This is my first post')
    end

    it 'can see the username of each commentor.' do
      expect(page).to have_content 'Carlos'
      expect(page).to have_content 'Luis'
      expect(page).to have_content 'Lorena'
    end

    it 'can see the comments of each commentor.' do
      expect(page).to have_content 'Comment first'
      expect(page).to have_content 'Comment another'
      expect(page).to have_content 'Comment new'
    end
  end
end
