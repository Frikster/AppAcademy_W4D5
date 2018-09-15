class Goal < ApplicationRecord
  validates :title, :details, :cheers, :user_id, presence: true
  belongs_to :user
end
