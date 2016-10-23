class DashboardController < ApplicationController

  def index
    @jobs = Job.order(:level_of_interest).reverse
    @companies = Company.all
  end
end
