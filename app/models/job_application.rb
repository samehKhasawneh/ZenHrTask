class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job_post

  # enum status: { 0: not_seen, 1: seen}
end
