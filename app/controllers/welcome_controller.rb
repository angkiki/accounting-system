class WelcomeController < ApplicationController
  include ApplicationHelper

  def home
  end

  def balance_sheet
    @asset = TotalAsset.all
    @liability = TotalLiability.all
    @equity = TotalEquity.all
  end

  def general_ledger
    @account = Account.all.sort { |a| a.name }
  end

end
