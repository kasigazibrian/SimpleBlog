require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do

    it 'should return success' do
      get :index
      expect(response.status).to eql(200)
    end
  end

  describe 'POST #create' do
    it 'should redirect after successful post' do
      post :create, params: { post: { title: "my first post", body: 'this is my first post'} }

      expect(response.status).to eql(302)
    end
  end
end
