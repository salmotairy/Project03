Rails.application.routes.draw do
  root "users#show"
  devise_for :users
  resources :stacks, :cards
  resources :users, only: [:show, :index]
  get "/:username/stacks", to: "stacks#your_stacks"
  get "/users/:username/connect", to: "users#connect"
  get "/approvals/:id/confirm", to: "users#confirm"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "users/username", to: "users#show"
end
