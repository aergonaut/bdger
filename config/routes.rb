Bdger::Application.routes.draw do
  # devise
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  devise_scope :user do
    get "sign_in", to: "devise/sessions#new", as: :new_user_session
    get "sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  end

  # badges
  resources :badges

  match "privacy" => "home#privacy", as: :privacy
  match "terms" => "home#terms", as: :terms
  match "contact" => "home#contact", as: :contact
  match "help" => "home#help", as: :help

  # users
  get "profile" => "users#profile", as: :profile
  get ":username" => "users#show", as: :user
  get "profile/edit" => "users#edit", as: :edit_profile
  put ":username" => "users#update"

  # achievements
  get ":username/badges/:achievement_hash" => "achievements#show", as: :achievement
  get "badges/:badge_id/claim" => "achievements#new", as: :new_achievement
  post ":username/badges" => "achievements#create", as: :user_badges
  get ":username/badges/:achievement_hash/edit" => "achievements#edit", as: :edit_achievement
  put ":username/badges/:achievement_hash" => "achievements#update"
  delete ":username/badges/:achievement_hash" => "achievements#destroy"

  root to: "home#index"
end
