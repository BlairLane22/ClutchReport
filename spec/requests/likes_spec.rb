require 'rails_helper'

RSpec.describe "Likes", type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:post_record) { create(:post, user: user, category: category) }

  describe "POST /posts/:post_id/likes" do
    context 'when user is signed in' do
      before { sign_in user }

      it 'creates a like' do
        expect {
          post "/posts/#{post_record.id}/likes"
        }.to change(Like, :count).by(1)
        
        expect(response).to redirect_to(post_record)
      end
    end

    context 'when user is not signed in' do
      it 'creates anonymous like' do
        expect {
          post "/posts/#{post_record.id}/likes"
        }.to change(Like, :count).by(1)
        
        expect(response).to redirect_to(post_record)
      end
    end
  end
end
