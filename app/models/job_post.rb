class JobPost < ApplicationRecord
  belongs_to :user
  has_many :job_applications, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
