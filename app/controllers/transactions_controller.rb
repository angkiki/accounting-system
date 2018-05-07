class TransactionsController < ApplicationController

  def new
    @transaction = Transaction.new
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

  private
  def transaction_params
    params.require(:transaction).permit(:date, :account_id, :amount, :description)
  end

end
