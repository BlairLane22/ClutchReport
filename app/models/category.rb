class Category < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  before_save :generate_slug

  private

  def generate_slug
    self.slug = name.parameterize if name.present?
  end
end
