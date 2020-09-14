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
  get '/users/:id/leave' => "users#leave"
  patch '/users/:id/hide' => "users#hide"
  resources :users, except:[:new, :create]
  resources :comics do
    resources :impressions, only:[:index, :show, :new, :create, :destroy, :edit, :update]
  end

end
