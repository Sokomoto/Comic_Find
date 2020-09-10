Rails.application.routes.draw do
  devise_for :admins
  namespace :adimin do
  	get '/' => "home#top"
  	resources :comics do
     resources :impressions
  	end
    resources :users, except:[:new]
  end

  devise_for :users
  root to: 'homes#top'
  resources :users, except:[:new, :create]
  get '/users/:id/leave' => "users#leave"
  patch '/users/:id/hide' => "users#hide"
  resources :comics do
    resources :impressions, only:[:index, :show, :new, :create, :destroy, :edit, :update]
  end

end
