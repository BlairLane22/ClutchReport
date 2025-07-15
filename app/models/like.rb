class Like < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post

  validates :user_id, uniqueness: { scope: :post_id }, allow_nil: true
  validates :session_id, uniqueness: { scope: :post_id }, allow_nil: true
  
  validate :user_or_session_present
  
  def anonymous?
    user_id.nil?
  end
  
  private
  
  def user_or_session_present
    if user_id.blank? && session_id.blank?
      errors.add(:base, "Must have either user or session")
    end
  end
end
