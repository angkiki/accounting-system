class AccountsController < ApplicationController
  before_action :reject_if_no_company_selected

  def new
    @account = Account.new
    @company = Company.find(session[:selected_company_id])
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      flash[:success] = 'Account Created!'
      redirect_to new_account_path
    else
      flash[:danger] = 'Account Not Created!'
      redirect_to new_account_path
    end
  end

  def show
    @account = Account.find(params[:id])
    @transactions = @account.transactions.sort_by { |t| t.date }
  end


  private
  def account_params
    params.require(:account).permit(:type, :name, :company_id)
  end

  def reject_if_no_company_selected
    unless session[:selected_company_id]
      flash[:danger] = 'Select A Company First!'
      redirect_to root_path
    end
  end
end
