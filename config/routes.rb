

Rails.application.routes.draw do
  
  get 'test' => 'home#test'
  get 'bondy' => 'home#bondy'
  
  namespace :rapidfire do
  get 'survey_result/makesurvey'
  end

  mount Rapidfire::Engine => "/rapidfire"
  
  
  resources :question_groups do
    get 'results', on: :member
    resources :questions
    resources :answer_groups, only: [:new, :create]
  end
  

  get 'home/about'
  get 'rapidfire/survey_results/makesurvey' => 'rapidfire/survey_results#makesurvey'
  
  devise_scope :user do
    authenticated :user do
      root 'rapidfire/question_groups#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
  # devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  
end



