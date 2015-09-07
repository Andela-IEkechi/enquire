Rails.application.routes.draw do

  resources :articles
  resources :questions
  resources :hospital_lists
  resources :doctor_lists, except: [:edit, :update, :show]
  resources :hospital_verification_requests, except: [:edit, :update]
  resources :doctor_verification_requests, except: [:edit, :update]

  get 'tags/:tag', to: 'questions#index', as: "tag"
  get 'questions/autocomplete_tag_name'
  get 'questions/autocomplete_question_body'
  get 'articles/autocomplete_article_title'

  resources :reviews
  resources :hospitals
  resources :answers, except: [:show]
  resources :profiles, only: [:show, :index] #todo do we really need show????
  resource  :dashboard, only: :show
  resources :doctors
  resources :hospital_likes, only: [:new, :create, :destroy]
  resources :answer_likes, only: [:new, :create, :destroy]
  resources :doctor_likes, only: [:new, :create, :destroy]
  resources :follows, only: [:new, :create, :destroy]
  resources :ratings, only: :update

  post 'answer' => 'questions#answer'
  get 'hospitals/:id/doctors' => 'hospitals#our_doctors', as: :our_doctors

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => :registrations }

  root 'homes#show'

  mount Ckeditor::Engine => '/ckeditor'
end
