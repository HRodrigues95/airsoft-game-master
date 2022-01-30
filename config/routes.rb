Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :game_modes do
      patch 'start', to: 'game_modes#start_game'
      patch 'end', to: 'game_modes#end_game'

      resources :locations, only: [:index, :show, :update]
      resources :teams, only: [:index, :show, :update] do
        patch 'increase', to: 'teams#increase_points'
        patch 'decrease', to: 'teams#decrease_points'
      end
    end
  end
end
