class Account < ApplicationRecord
  has_many :transactions

  # has 5 different types of accounts
  # total_asset
  # total_liability
  # total_equity
  # revenue
  # expense

  AccountTypes = [
    ["Asset", "TotalAsset"],
    ["Liability", "TotalLiability"],
    ["Equity", "TotalEquity"],
    ["Revenue", "Revenue"],
    ["Expense", "Expense"]
  ]
end
