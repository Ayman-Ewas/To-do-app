class Task < ApplicationRecord
  validates :title, presence: true

    def toggle_status
      # Simple status cycling
      case status
      when 'pending'
        update(status: 'in_progress')
      when 'in_progress'
        update(status: 'completed')
      when 'completed'
        update(status: 'pending')
      end
    end
end
