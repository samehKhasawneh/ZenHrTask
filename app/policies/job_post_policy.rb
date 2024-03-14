class JobPostPolicy < ApplicationPolicy
  attr_reader :user, :job_post

  def initialize(user, job_post)
    @user = user
    @job_post = job_post
  end

  def create?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
