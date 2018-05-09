class WelcomeController < ApplicationController
  include ApplicationHelper
  before_action :reject_if_no_company_selected, only: [:general_ledger]

  def home
    @company = Company.all
  end

  def balance_sheet
    # @company = Company.find(session[:selected_company_id])
    #
    # @asset = @company.total_assets.all
    # @liability = @company.total_liabilities.all
    # @equity = TotalEquity.all
  end

  def general_ledger
    @company = Company.find(session[:selected_company_id])
    @account = @company.accounts.sort_by { |a| a.name }
  end

  def selected_company
    session[:selected_company_id] = params[:id]
    redirect_to root_path
  end

  private
  def reject_if_no_company_selected
    unless session[:selected_company_id]
      flash[:danger] = 'Select A Company First!'
      redirect_to root_path
    end
  end

end
