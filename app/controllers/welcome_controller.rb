class WelcomeController < ApplicationController
  include ApplicationHelper
  before_action :reject_if_no_company_selected, only: [:general_ledger]

  def home
    @company = current_user.companies
  end

  def balance_sheet
    @company = Company.includes(:accounts).find(session[:selected_company_id])

    @pnl = @company.profit_and_loss_figure
    @asset = @company.total_assets
    @liability = @company.total_liabilities
    @equity = @company.total_equities
  end

  def profit_and_loss
    @company = Company.find(session[:selected_company_id])

    @revenue = @company.revenues
    @expense = @company.expenses
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
