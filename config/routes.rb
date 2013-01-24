Bdger::Application.routes.draw do
  # devise
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  devise_scope :user do
    get "sign_in", to: "devise/sessions#new", as: :new_user_session
    get "sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  end

  # badges
  resources :badges

  match "about" => "home#about", as: :about
  match "privacy" => "home#privacy", as: :privacy
  match "faq" => "home#faq", as: :faq
  match "contact" => "home#contact", as: :contact

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

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
    # match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
