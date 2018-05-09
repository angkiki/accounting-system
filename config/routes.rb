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
  get "general-ledger", to: "welcome#general_ledger"
  get "selected-company/:id", to: "welcome#selected_company"
end
