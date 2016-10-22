class JobsController < ApplicationController

  def index
    @contacts = Contact.all
    @contact = Contact.new
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new

    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @job = Job.find(params[:id])
  end

  def edit
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    if Job.update(params[:id], job_params)
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.delete

    # flash[:success] = "#{job.title} was successfully deleted!"
    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :category_id)
  end
end
