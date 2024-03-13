class JobPostsController < ApplicationController
  before_action :authorize_admin!, only: [:create, :destroy]

  # GET /job_posts/:id
  def show
    @job_post = JobPost.find(params[:id])
    render json: @job_post
  end
  
  # GET /job_posts
  def index
    @job_post = JobPost.all
    render json: @job_post
  end

  # POST /job_posts
  def create
    @job_post = JobPost.new(job_post_params)
    @job_post.user = current_user
    if @job_post.save
      render json: @job_post, status: :created
    else
      render json: @job_post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /job_posts/:id
  def destroy
    @job_post = JobPost.find(params[:id])
    @job_post.destroy
    head :no_content
  end

  private

  def job_post_params
    params.require(:job_post).permit(:title, :description)
  end

  def authorize_admin!
    authorize JobPost
  end
end
