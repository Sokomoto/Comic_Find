Rails.application.routes.draw do
  devise_for :admins
  namespace :adimin do
  	get '/' => "home#top"
  	resources :comics
    resources :comic_impressions
  	resources :users, except:[:new]
  end

  devise_for :users
  root to: 'homes#top'
  resources :users, except:[:new, :create]
  get '/users/:id/leave' => "users#leave"
  patch '/users/:id/hide' => "users#hide"
  resources :comics
  resources :comic_impressions

end
