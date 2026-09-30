class Task < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  scope :by_user, ->(user) { where(user: user) }

    def toggle_status
      if status == 'pending'
        update!(status: 'in-progress')
      else
        update!(status: 'Done')
        
      end
    end

 
end
