class WelcomeController < ApplicationController

  def home
  end

  def balance_sheet
    @asset = TotalAsset.all
    @liability = TotalLiability.all
    @equity = TotalEquity.all
  end

  def general_ledger
    @asset = TotalAsset.all
    @liability = TotalLiability.all
    @equity = TotalEquity.all
  end

end
