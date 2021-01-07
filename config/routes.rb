Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
# 下記、commentsテーブルの情報をprototype投稿へ紐づけるためネストで記述
  resources :prototypes do
    resources :comments, only: :create
  end
    resources :users, only: :show
  
end
