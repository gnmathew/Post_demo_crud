Rails.application.routes.draw do
  devise_for :users
  get "weldome/index"
  root "posts#index"
  resources :posts do
    resources :comments, except: :show
  end
  resources :categories, except: :show

end
