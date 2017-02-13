Rails.application.routes.draw do


  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  resources :expenses
  get 'main/index'
  get 'admin/users'

  get 'amazon/index' # link for Julio to calculate ML costs
  #post 'amazon/update/:id', to: 'amazon#update' # to pass a parameter
  post 'amazon/update', to: 'amazon#update', as: 'amazon_update'
  post 'amazon/calculate_price', to: 'amazon#calculate_price', as: 'amazon_calculate_price'



=begin RESTful
  get "/expenses" index
  post "/expenses" create
  delete "/expenses/:id" destroy
  get "/expenses/:id" show
  get "/expenses/new" new
  get "/expenses/:id/edit" edit
  patch "/expenses/id" update
  put "/expenses/id" updtate
=end



  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products




end
