Rails.application.routes.draw do
  root to: "occasions#index", as: :occasions_index
  devise_for :users
  get "/users/:user_id/occasions/new" => 'occasions#new', as: :new_user_occasion
  get "/users/:user_id/occasions/:id" =>   "occasions#show", as: :user_occasion
  post "/users/:user_id/occasions/" =>   "occasions#create", as: :user_occasions
  delete "/users/:user_id/occasions/:id" =>   "occasions#destroy"
  get "/receivers/new/:occasion_id" => "receivers#new", as: :new_receiver
  post "/receivers/:occasion_id" => "receivers#create", as: :receivers

  get "/gifts/index" =>   "gifts#index", as: :gifts
  get "/gifts/update/:occasion_id/:user_id" => "gifts#edit", as: :edit_gift  
  put "/gifts/update/:occasion_id" => "gifts#update"

  get "/avatars/new" => "avatars#new", as: :new_avatar
  post "/avatars/create" => "avatars#create", as: :avatars

  get "/happenings/new/:user_id/:occasion_id" => "happenings#new", as: :new_happening
  post "/happenings/:user_id/:occasion_id" => "happenings#create", as: :happenings




   # get "/happenings/new/:user_id/:occasion_id" => "happenings#new" as: :new_happening
  # post "/happenings/new/:user_id/:occasion_id" => "happenings#create" as: :happenings


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
