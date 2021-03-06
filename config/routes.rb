Rails.application.routes.draw do
  devise_for :users
  resources :companies
  resources :accounts
  resources :transactions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root "welcome#home"
  authenticated :user do
    root to: 'welcome#home', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')

  get "balance-sheet", to: "welcome#balance_sheet"
  get "profit-and-loss", to: "welcome#profit_and_loss"
  get "general-ledger", to: "welcome#general_ledger"
  get "double-entry-ledger", to: "welcome#double_entry_ledger"
  get "selected-company/:id", to: "welcome#selected_company", as: "selected_company"
end
