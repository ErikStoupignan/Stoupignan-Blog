require 'rails_helper'

RSpec.describe 'Controller management for POSTS/INDEX', type: :request do
  before(:each) do
    get 'http://localhost:3000/users/1/posts'
  end

  it 'Template rendered' do
    expect(response).to render_template('posts/index')
  end

  it 'Check response status' do
    expect(response.status).to eq(200)
  end

  it 'esponse body includes correct placeholder text' do
    expect(response.body).to include 'All users list'
  end
end

RSpec.describe 'Controller management FOR USERS/SHOW', type: :request do
  before(:each) do
    get 'http://localhost:3000/users/1/posts/1'
  end

  it 'Template rendered' do
    expect(response).to render_template('posts/show')
  end

  it 'Check response status' do
    expect(response.status).to eq(200)
  end

  it 'esponse body includes correct placeholder text' do
    expect(response.body).to include 'This page will show all the posts from an user'
  end
end
