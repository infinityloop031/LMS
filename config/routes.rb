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
    resources :students
    get 'dashboard/allcourses/:id', to: 'dashboard#display_All_courses'
    get 'dashboard/transcript/:id', to: 'dashboard#showtranscript', as: :transcript  # defining own prefixes using this!
    get 'dashboard/showprofile/:id', to: 'dashboard#showprofile', as: :showprofile
  end


  namespace :teacher do
    root 'dashboard#index'
    resources :dashboard do
      collection do
        get :courses
        get :showprofile
        get :pastcourses
      end
    end
  end

end
