Rails.application.routes.draw do
  devise_for :admins
  namespace :adimin do
  	get '/' => "home#top"
  	resources :comics
    resources :comic_impressions
    resources :considerations
    resources :consideration_comments
  	resources :users, except:[:new]
  end

  devise_for :users
  root to: 'homes#top'
  resources :users, except:[:new, :create]
  get '/users/:id/leave' => "users#leave"
  patch '/users/:id/hide' => "users#hide"
  resources :comics, except:[:new]
  resources :comic_impressions, except:[:new]
  resources :considerations, except:[:new]
  resources :consideration_comments, except:[:new]

end
