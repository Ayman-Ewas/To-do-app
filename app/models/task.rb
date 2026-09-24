class Task < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  scope :by_user, ->(user) { where(user: user) }

    def toggle_status
      # Simple status cycling
      if task.by_user(user).status == "pending"  
        task.by_user(user).status = "in-progress"

      end
    end
end
