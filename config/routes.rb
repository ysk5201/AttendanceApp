Rails.application.routes.draw do
  # Defines the root path route ("/")
  # localhost:3000にアクセスしたときposts/newを表示する
  root "posts#new"

  # GETリクエストが/loginに送信された場合。ログインページの表示に使用
  # POSTリクエストが/loginに送信された場合。ユーザーがログイン情報を入力して送信するために使用
  # DELETEリクエストが/logoutに送信された場合。ユーザーがログアウトするときに使用
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # localhost:3000/posts/index
  # localhost:3000/posts/new
  # localhost:3000/posts/create
  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
  get '/posts/all_posts', to: 'posts#all_posts', as: 'all_posts'
end
