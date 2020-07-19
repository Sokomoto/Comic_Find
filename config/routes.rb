Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get '/home/about' => 'abouts#top'
  resources :users, except:[:new, :create]
  resources :books, except:[:new]
end
