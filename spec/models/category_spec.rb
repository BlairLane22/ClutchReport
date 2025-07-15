require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it { should have_many(:posts).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'attributes' do
    it 'has name, slug, description, and color attributes' do
      category = build(:category, 
        name: "Football", 
        slug: "football", 
        description: "American Football", 
        color: "#FF0000"
      )
      
      expect(category.name).to eq("Football")
      expect(category.slug).to eq("football")
      expect(category.description).to eq("American Football")
      expect(category.color).to eq("#FF0000")
    end
  end
end
