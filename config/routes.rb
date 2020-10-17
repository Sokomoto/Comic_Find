Rails.application.routes.draw do
  devise_for :admins
  namespace :admins do
  	get '/' => "homes#top"
  	resources :comics do
      resource :favorites, only:[:create, :destroy]
      resources :impressions, only:[:index, :show, :new, :create, :destroy, :edit, :update]
  	end
      resources :users, except:[:new] do
        #ユーザーが投稿したタイトル・レビューを表示させるルーティング
        member do
          get :postindex
          get :postimpression
        end
      end
  end

  devise_for :users
  root to: 'homes#top'
  get '/users/:id/leave' => "users#leave"
  patch '/users/:id/hide' => "users#hide"
  resources :users, except:[:new, :create] do
    #ユーザーが投稿したタイトル・レビューを表示させるルーティング
    member do
      get :postindex
      get :postimpression
    end
  end
  resources :comics do
    resource :favorites, only:[:create, :destroy]
    resources :impressions, only:[:index, :show, :new, :create, :destroy, :edit, :update]
  end
  #タグで絞り込んだ投稿を表示するルーティング
  resources :tags do
    get 'comics', to:'comics#search'
  end

  #管理者側のタグで絞り込んだ投稿を表示するルーティング
  resources :tags do
    get 'admins/comics', to:'admins/comics#search'
  end

  get 'admins/search' => "admins/search#search"
  get '/search' => "search#search"

end
