Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
<<<<<<< Updated upstream
    resources :orders, only: [:index, :create]
=======
    resources :purchases, only: [:index]
>>>>>>> Stashed changes
  end
end
