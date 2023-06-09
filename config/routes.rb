Rails.application.routes.draw do

# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
    resources :users,only: [:index,:show,:edit,:update,:destroy]
  end

  namespace :admin do
    resources :posts,only: [:index,:show,:edit,:update,:destroy]

  end
  namespace :admin do
    get 'homes/top'
  end


  # ユーザー用
# URL /customers/sign_in ..
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  get 'about' => 'public/homes#about'
  root 'public/homes#top'
 scope module: :public do
    resources :posts,only: [:index,:new,:create,:show,:edit,:update,:destroy]

    resources :packings,only: [:index,:new,:create,:show,:edit,:update,:destroy]

    resources :schedules,only: [:index,:new,:create,:show,:edit,:update,:destroy]

    resources :users,only: [:show,:edit,:update,:destroy]

    get 'users/unsubscribe'
    get 'users/withdraw'

    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    get 'search/search'

 end

end
