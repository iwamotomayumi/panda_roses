Rails.application.routes.draw do



  namespace :public do
    get 'users/show'
    get 'users/edit'

  end
 # 会員用
# URL /users/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


# 会員用
scope module: :public do
  root to: "homes#top"
  get 'users/unsubscribe'
  patch 'users/withdrawal'
  resources :users
  resources :post_images do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
 end
end


# 管理者用
 namespace :admin do
    root to: "homes#top"
    resources :users
    resources :items
    resources :post_images do
      resources :post_comments, only: [:destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
