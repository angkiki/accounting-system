class TransactionsController < ApplicationController
  before_action :reject_if_no_company_selected

  def new
    @transaction = Transaction.new
    @company = Company.find(session[:selected_company_id])
  end

  def create
    @date = transaction_params[:date]

    @debit_amount = transaction_params[:amount].to_f
    @credit_amount = transaction_params[:amount].to_f * -1

    @description = transaction_params[:description]

    @debit_account_id = params[:debit_account_id]
    @credit_account_id = params[:credit_account_id]

    Transaction.create(date: @date, amount: @debit_amount, description: @description, account_id: @debit_account_id)
    Transaction.create(date: @date, amount: @credit_amount, description: @description, account_id: @credit_account_id)

    flash[:success] = 'Transactions Saved'
    redirect_to new_transaction_path
  end

  def edit
    @company = Company.find(session[:selected_company_id])
    @transaction = Transaction.find(params[:id])
    session[:old_account_id] = @transaction.account.id
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update_attributes(transaction_params)
      flash[:success] = 'Updated Transaction'
      redirect_to account_path(session[:old_account_id])
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    flash[:danger] = 'Transaction deleted'
    redirect_to general_ledger_path
  end

  private
  def transaction_params
    params.require(:transaction).permit(:date, :account_id, :amount, :description)
  end

  def reject_if_no_company_selected
    unless session[:selected_company_id]
      flash[:danger] = 'Select A Company First!'
      redirect_to root_path
    end
  end
end
