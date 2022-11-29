require 'rails_helper'

RSpec.describe 'Controller management for USERS/INDEX', type: :request do
  before(:each) do
    get 'http://localhost:3000/users/'
  end

  it 'Template rendered' do
    expect(response).to render_template('users/index')
  end

  it 'Check response status' do
    expect(response.status).to eq(200)
  end

  it 'esponse body includes correct placeholder text' do
    expect(response.body).to include '2022'
  end
end

RSpec.describe 'Controller management FOR USERS/SHOW', type: :request do
  before(:each) do
    get 'http://localhost:3000/users/1'
  end

  it 'Template rendered' do
    expect(response).to render_template('users/show')
  end

  it 'Check response status' do
    expect(response.status).to eq(200)
  end

  it 'esponse body includes correct placeholder text' do
    expect(response.body).to include 'This is the method show Users'
  end
end
