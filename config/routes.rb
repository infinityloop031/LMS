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
    resources :students
    resources :dashboard, only: :index do
      collection do
        get :display_all_courses
        get :show_transcript
        get :show_profile
        post :upload_image
      end
    end
    # get 'dashboard/allcourses/', to: 'dashboard#display_All_courses'
    # get 'dashboard/transcript/', to: 'dashboard#showtranscript', as: :transcript  # defining own prefixes using this!
    # get 'dashboard/showprofile/', to: 'dashboard#showprofile', as: :showprofile
  end

  namespace :teacher do
    root 'dashboard#index'
    resources :dashboard do
      collection do
        get :courses
        get :show_profile
        get :past_courses
      end
    end
  end

  root 'home#index'

end
