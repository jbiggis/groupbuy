Groupbuy::Application.routes.draw do

  scope "(:locale)", :locale => /en|zh/ do
  devise_for :admins,  :controllers => { :registrations => "admins/registrations" }

  devise_for :users,  :controllers => { :registrations => "users/registrations" }



  resources :coupons

  resources :orders

  resources :profiles


  resources :deals
  end

  resources :emails, :only => [:create]
 
  resources :authentications

  match '/auth/:provider/callback' => 'authentications#create'


  match '/admin/home', :to => 'admin#home'
 
  devise_for :admins do
    get "admin/admins", :to => "admins/registrations#index"
  end



  match '/deal', :to => 'public#deal'
  match '/checkout', :to =>'public#checkout'
  post 'public/create'
  
  match '/past_deals', :to => 'public#past_deals'

  match '/member/my_coupons', :to => 'member#my_coupons'
  match '/member/my_profile', :to => 'member#my_profile'

  match '/about', :to => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/how-it-works', :to => 'pages#how_it_works'

match '/:locale' => 'public#home'
  root :to => "public#home"

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'

   match ':controller(/:action(/:id(.:format)))'


end
