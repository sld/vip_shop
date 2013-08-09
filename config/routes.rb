VipShop::Application.routes.draw do
  devise_for :users, :only => [:sessions]

  root "main#index"

  post "balances/increase" => "balances#increase"

  scope '/carts' do 
    get "add/:product_id" => "carts#add", :as => :carts_add
    get "index" => "carts#index", :as => :carts_index
    get "delete_product/:product_id" => "carts#delete_product", :as => :carts_delete_product
    get "increase_quantity/:cart_product_id" => "carts#increase_quantity", :as => :carts_increase_quantity
    get "decrease_quantity/:cart_product_id" => "carts#decrease_quantity", :as => :carts_decrease_quantity
  end

  resources :buyings, :only => [:index] do 
    collection do 
      post 'create_from_cart' 
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
