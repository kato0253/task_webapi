Rails.application.routes.draw do

  get 'address/show'
  root to: 'other_pages#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  devise_scope :user do
    get 'my_page', to: 'users/registrations#my_page', as: 'my_page'
  end
  resources :favorites, only: [:create, :destroy]

  resources :articles do
    collection do
      post :confirm
      patch :confirm
    end
  end

  resources :articles do
    member do
      post :confirm
      patch :confirm
    end
  end

  resources :articles do
    resources :comments
  end

  namespace 'api' do
    namespace 'v1' do
      resources :posts
    end
  end
end
