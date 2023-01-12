Rails.application.routes.draw do
  devise_for :teachers
  devise_for :students
  devise_for :admins

  # devise_scope :admin do
  #   root "admins/sessions#new"
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  namespace :admin do
    root 'dashboard#index'
    resources :students
    resources :teachers
    resources :dashboard
    resources :courses
    resources :enrollments
    resources :sections
  end

  namespace :student do
    root 'dashboard#index'
    resources :dashboard
  end
end
