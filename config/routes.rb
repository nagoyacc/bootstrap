Rails.application.routes.draw do
  get 'sessions/new'
  resources :feeds
  # get    '/blogs'          ,to: 'blogs#index'
  # post   '/blogs'          ,to: 'blogs#create'
  # get    '/blogs/new'      ,to: 'blogs#new'
  # get    '/blogs/:id/edit' ,to: 'blogs#new'
  # get    '/blogs/:id'      ,to: 'blogs#show'
  # patch  '/blogs/:id'      ,to: 'blogs#update'
  # delete '/blogs/:id'      ,to: 'blogs#destroy'

  # resources :blogs    #自動で、上記よく使われるRESTfulなルート定義を7つ生成してくれます
  resources :blogs do
    collection do
      post :confirm
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  #form_withを使用するにはcreateアクションのルーティングが必要になる
  resources :users, only: [:new, :create, :show]

end
