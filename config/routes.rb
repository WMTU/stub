Rails.application.routes.draw do
  root to: 'tickets#stats'

  get 'tickets/index'

  resource :sessions, only: [:new, :create, :destroy]

  namespace :api do
    resource :tickets, only: [] do
      post :dj
      post :band
      post :both
    end

    resource :tokens, only: [:create, :destroy]
  end
end
