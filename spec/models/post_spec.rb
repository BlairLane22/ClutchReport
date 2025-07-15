require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_one_attached(:photo) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    
    it 'validates acceptable photo format' do
      post = build(:post, user: user, category: category)
      # Test acceptable_photo validation if implemented
    end
  end

  describe 'scopes' do
    let!(:published_post) { create(:post, published: true, user: user, category: category) }
    let!(:unpublished_post) { create(:post, published: false, user: user, category: category) }

    it 'returns only published posts' do
      expect(Post.published).to include(published_post)
      expect(Post.published).not_to include(unpublished_post)
    end
  end

  describe 'callbacks' do
    describe '#generate_slug' do
      it 'generates slug from title before save' do
        post = create(:post, title: "My Great Post", user: user, category: category)
        expect(post.slug).to eq("my-great-post")
      end

      it 'handles special characters in title' do
        post = create(:post, title: "Post with Special & Characters!", user: user, category: category)
        expect(post.slug).to eq("post-with-special-characters")
      end
    end

    describe '#generate_excerpt' do
      it 'generates excerpt from content before save' do
        long_content = "A" * 200
        post = create(:post, content: long_content, user: user, category: category)
        expect(post.excerpt.length).to be <= 153 # 150 + "..."
      end

      it 'uses full content if shorter than 150 characters' do
        short_content = "Short content"
        post = create(:post, content: short_content, user: user, category: category)
        expect(post.excerpt).to eq(short_content)
      end
    end
  end
end
