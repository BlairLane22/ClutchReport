require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:post) { create(:post, user: user, category: category) }

  describe 'associations' do
    it { should belong_to(:post) }
    it { should belong_to(:user).optional }
  end

  describe 'validations' do
    context 'for authenticated users' do
      it 'prevents duplicate likes from same user on same post' do
        create(:like, user: user, post: post)
        duplicate_like = build(:like, user: user, post: post)
        expect(duplicate_like).not_to be_valid
      end
    end

    context 'for anonymous users' do
      it 'prevents duplicate likes from same session on same post' do
        create(:like, post: post, session_id: "session123")
        duplicate_like = build(:like, post: post, session_id: "session123")
        expect(duplicate_like).not_to be_valid
      end
    end
  end

  describe 'anonymous likes' do
    it 'can create like with session_id instead of user' do
      like = create(:like, post: post, session_id: "anonymous_session", user: nil)
      expect(like).to be_valid
      expect(like.session_id).to eq("anonymous_session")
      expect(like.user).to be_nil
    end
  end
end
