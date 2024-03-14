require 'rails_helper'

RSpec.describe JobPost, type: :model do
  it 'is valid with valid attributes' do
    job_post = build(:job_post)
    expect(job_post).to be_valid
  end

  it 'is not valid without a title' do
    job_post = build(:job_post, :missing_title)
    expect(job_post).to_not be_valid
  end
end
