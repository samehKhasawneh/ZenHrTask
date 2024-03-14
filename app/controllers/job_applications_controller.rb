class JobApplicationsController < ApplicationController

  # GET /job_applications
  def index
    @job_applications = current_user.job_applications
    render json: @job_applications
  end

  # POST /job_applications
  def create
    @job_post = JobPost.find(params[:job_post_id])
    @job_application = current_user.job_applications.build(job_post: @job_post)
    
    if @job_application.save
      render json: @job_application, status: :created
    else
      render json: @job_application.errors, status: :unprocessable_entity
    end
  end

  # GET /job_applications/:id
  def show
    @job_application = JobApplication.find(params[:id])
    render json: @job_application
  end
end
