TgnAgain::Application.routes.draw do
 

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => {:confirmations => "confirmations"}
  ActiveAdmin.routes(self)

  #mount Messaging::Engine => "/messaging"
  resources :users do
    resources :messages do
        collection do
            post :delete_selected
        end
    end
end
 
 devise_scope :user do
    get "login", :to => "devise/sessions#new"
    get "register", :to => "devise/registrations#new"
    get "settings", :to => "devise/sessions#edit"
    get "logout",   :to => "devise/sessions#destroy"    
  end

  resources :swaps
resources :farms
  
  resources :products
  resources :farms do 
    resources :products do
    collection { post :search, to: 'products#index' }
  end
end
  
  resources :users do
    resources :swaps
  end
resources :farms do
  member do
    get :follow
    get :unfollow
  end
end

  
root to: "static_pages#home"




  

  # match '/signup', to: "users#new"
  # match '/signin', to: "sessions#new"
  # match '/signout', to: "sessions#destroy", via: :delete

  match '/products', to: 'products#index'
  match '/growers', to: 'farms#index'
  match 'followed_products', to: 'static_pages#followed_products'
  match 'i_am_following', to: 'static_pages#i_am_following'
  match 'farm_map', to: 'static_pages#farm_map'
  
  match '/search', to: "static_pages#search"
  match '/help', to: "static_pages#help"
  match '/welcome', to: "static_pages#welcome"
  match '/contact', to: "static_pages#contact"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
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
