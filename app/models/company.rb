class Company < ApplicationRecord
  belongs_to :user
  has_many :accounts
  has_many :total_assets
  has_many :total_equities
  has_many :total_liabilities
  has_many :revenues
  has_many :expenses

  has_many :transactions, through: :accounts

  def profit_and_loss_figure
    total_revenue = 0
    total_expense = 0

    self.revenues.each do |acc|
      total_revenue += acc.transactions.sum(:amount)
    end

    self.expenses.each do |acc|
      total_expense += acc.transactions.sum(:amount)
    end

    return total_revenue + total_expense
  end
end
