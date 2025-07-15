require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  describe "GET /posts" do
    it "returns http success" do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /posts/:id" do
    let(:post) { create(:post, user: user, category: category) }

    it "returns http success" do
      get post_path(post)
      expect(response).to have_http_status(:success)
    end
  end
end
