require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
  end

  describe 'ordering' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let(:post) { create(:post, user: user, category: category) }
    
    it 'orders comments by creation date' do
      old_comment = create(:comment, post: post, user: user, created_at: 2.days.ago)
      new_comment = create(:comment, post: post, user: user, created_at: 1.day.ago)
      
      expect(post.comments.order(:created_at)).to eq([old_comment, new_comment])
    end
  end
end
