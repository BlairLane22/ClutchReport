require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'basic functionality' do
    it 'can be created' do
      user = User.new(email: 'test@example.com', password: 'password123', first_name: 'Test')
      expect(user).to be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:first_name) }
  end
end
