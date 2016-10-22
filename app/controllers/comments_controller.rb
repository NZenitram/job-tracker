class CommentsController < ApplicationController

  def create
    job = Job.find(params[:job][:id])
    company = job.company
    @comment = Comment.new(comments_params)
    @comment.job_id = job.id
    if @comment.save
      redirect_to company_job_path(company, job)
    else
      render :new
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end
end
