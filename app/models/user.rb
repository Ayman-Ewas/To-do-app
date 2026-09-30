class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_one_attached :avatar

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, presence: true, uniqueness: true
  validate :avatar_must_be_an_image

  private

  def avatar_must_be_an_image
    return unless avatar.attached?

    unless avatar.content_type&.start_with?("image/")
      errors.add(:avatar, "must be an image")
    end

    if avatar.byte_size > 5.megabytes
      errors.add(:avatar, "must be smaller than 5 MB")
    end
  end
end