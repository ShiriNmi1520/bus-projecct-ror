Rails.application.routes.draw do
  get 'bus/info'
  put 'bus/update'
  post 'bus/fetch'
  post 'users/register'
  post 'users/login'
  post 'users/forgotPassword'
  post 'users/verifyToken'
  post 'users/resetPassword'
  get 'users/list'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
