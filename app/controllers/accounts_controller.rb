class AccountsController < ApplicationController

  def new
    @account = Account.new
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
    @transactions = @account.transactions
  end

  private
  def account_params
    params.require(:account).permit(:type, :name)
  end
end
