Rails.application.routes.draw do

  resources :posts do
    resources :comments
  end

  # These routes are reather interesting, but why are these routable
  # destinations? It seem to me that the user should not be able to find these
  # routes.  Couldn't they be expressed as something like:
  #
  #
  # POST /post/:id/vote => 'posts#upvote'
  #
  # whose implementation:
  #
  # def upvote
  #   Post.find(params[:id]).votes.create
  # end
  #
  # That would create it, no?
  #
  # As a user I'm never going to POST /comment_votes/create, am I?  Seems
  # weird.  I think the Vote is a side-effect of updating the Comment or Post
  resources :comment_votes, only: [:create, :destroy]
  resources :post_votes, only: [:create, :destroy]


  # I like these routes, they're nice for that pretty aspect, also, nice work
  # on using the user_comments
  get "/user/:id/posts" => "users#posts", as: :user_posts
  get "/user/:id/comments" => "users#comments", as: :user_comments

  get "/login" => "sessions#index", as: :login_page
  post "/login" => "sessions#login", as: :login
  delete "/logout" => "sessions#destroy", as: :logout
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'posts#index'

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
