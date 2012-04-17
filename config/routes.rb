YouCloth::Application.routes.draw do

  namespace :admin do 
    resources :dashboard
    resources :posts  do
      resources :comments do
        #post :reply
        post :reply, :on => :member
      end
    end
  end

  #resources :comments

  # resources :comments do
  #   resources :comments
  # end
   #get "you/posts"
   #get "you/show"
   match "you/washes/:id" => 'you#show', as: "you_washes"
   match 'you' => 'you#index'
  scope "/you" do
      resources :posts
   end

  #resources :posts, :has_many => :comments
  resources :posts do
    resources :comments do
      post :reply
    end
  end

# resources :photos, :only => [:index, :show]
# resources :photos, :except => :destroy
  # resources :you,  :only => [:index, :show] do
  #   collection do
  #     get :messages
  #     get :posts
  #   end
  #  end

  # /dashboard/:id => /admin/dashboard#action
  # scope :module => 'admin' do
  #   resources :dashboard 
  # end

  resources :customers  do
    collection do
      get :users
      get :new_popup
      post :create_popup
    end
  end

  resources :washes do
    collection do
      get :customers
    end
  end

  resources :cloth_items

  resources :cloths

  #get "sessions/sign_up"
  resources :roles

  #devise_for :users
 # devise_for :users, :controllers => { :registrations => "users/registrations" }
  #devise_for :users, :controllers => { :sessions => "users/sessions", :registrations => "users/registrations" }
  devise_for :users, :controllers => { :sessions => "users/sessions", :registrations => "users/registrations" },
                      :path_names => { :sign_up => "register", 
                                      :sign_in => "login", 
                                      :sign_out => "logout",
                                      :settings => "settings" }
  devise_scope :user do
    post :change_customer, :to => "users/registrations#change_customer"
    put :change_customer, :to => "users/registrations#change_customer"
  end

#  devise_scope :user do
#    namespace :users do
#        resources :sessions, :only => [:index, :new, :create, :destroy,:sign_up]
#    end
#  end
  
 # devise_for :users, :path_names => { :sign_up => "register", 
 #                                      :sign_in => "login", 
 #                                      :sign_out => "logout",
 #                                      :settings => "settings" }

 #  devise_scope :user do
 #    get "login", :to => "devise/sessions#new"
 #    get "register", :to => "devise/registrations#new"
 #    get "settings", :to => "devise/registrations#edit"
 #    get "logout",   :to => "devise/sessions#destroy"
 #  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  #   match 'posts/:year(/:month)' => 'posts#index', :constraints => { :year => /\d{4}/ }
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
  root :to => "home#index"
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
