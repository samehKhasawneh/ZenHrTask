class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job_post

  validates :status, presence: true
end
