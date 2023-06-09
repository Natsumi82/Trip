Rails.application.routes.draw do

  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'packings/index'
    get 'packings/new'
    get 'packings/show'
    get 'packings/edit'
  end
  namespace :public do
    get 'schedules/index'
    get 'schedules/new'
    get 'schedules/show'
    get 'schedules/edit'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/unsubscribe'
    get 'users/withdraw'
  end
  namespace :public do
    get 'posts/index'
    get 'posts/new'
    get 'posts/show'
    get 'posts/edit'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

# ユーザー用
# URL /customers/sign_in ..
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

end
