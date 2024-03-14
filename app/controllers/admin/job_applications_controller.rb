module Admin
  class JobApplicationsController < ApplicationController
    before_action :authorize_admin!

    def index
      @job_post = JobPost.find(params[:job_post_id])
      @job_applications = @job_post.job_applications
      render json: @job_applications
    end

    def show
      @job_application = JobApplication.find(params[:id])
      @job_application.update(status: true)
      render json: @job_application
    end

    private

    def authorize_admin!
      unless current_user.admin?
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    end
  end
end
