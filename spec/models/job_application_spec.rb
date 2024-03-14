require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  it "is valid with valid attributes" do
    job_application = build(:job_application)
    expect(job_application).to be_valid
  end
end