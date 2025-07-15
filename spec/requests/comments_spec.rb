require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:post_record) { create(:post, user: user, category: category) }

  describe "POST /posts/:post_id/comments" do
    context 'when user is signed in' do
      before { sign_in user }

      it 'creates a comment' do
        expect {
          post "/posts/#{post_record.id}/comments", params: { comment: { content: 'Test comment' } }
        }.to change(Comment, :count).by(1)
        
        expect(response).to redirect_to(post_record)
      end
    end

    context 'when user is not signed in' do
      it 'redirects to sign in' do
        post "/posts/#{post_record.id}/comments", params: { comment: { content: 'Test comment' } }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
