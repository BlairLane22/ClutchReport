class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :content, presence: true
  validate :acceptable_photo

  scope :published, -> { where(published: true) }
  
  before_save :generate_slug
  before_save :generate_excerpt

  private

  def generate_slug
    self.slug = title.parameterize if title.present?
  end

  def generate_excerpt
    self.excerpt = content.truncate(150) if content.present?
  end

  def acceptable_photo
    return unless photo.attached?

    unless photo.blob.byte_size <= 5.megabyte
      errors.add(:photo, "is too big (should be at most 5MB)")
    end

    acceptable_types = ["image/jpeg", "image/png", "image/webp"]
    unless acceptable_types.include?(photo.blob.content_type)
      errors.add(:photo, "must be a JPEG, PNG, or WebP")
    end
  end
end
