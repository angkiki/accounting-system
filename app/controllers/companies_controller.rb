class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(companies_params)
    if @company.save
      flash[:success] = "Company Created"
      redirect_to root_path
    else
      flash[:danger] = "Something Went Wrong"
      redirect_to new_company_path
    end
  end

  private
  def companies_params
    params.require(:company).permit(:name, :user_id)
  end
end
