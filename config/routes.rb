Rails.application.routes.draw do
  resources :accounts
  resources :transactions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#home"

  get "balance-sheet", to: "welcome#balance_sheet"
  get "general-ledger", to: "welcome#general_ledger"
end
