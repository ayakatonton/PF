Rails.application.routes.draw do
  
  namespace :public do
    get 'calendar/index'
  end
  devise_for :admins
  
  devise_for :users
  
  scope module: :public do
    get '/top' => 'homes#top'
    get 'event_bookmarks/index'
    get 'event_bookmarks/show'
    get 'event_bookmarks/new'
    get 'event_bookmarks/edit'
    get 'photo_bookmarks/index'
    get 'photo_bookmarks/show'
    get 'photo_bookmarks/new'
    get 'photo_bookmarks/edit'
   
    resources :users
    resources :groups
    resources :events
    resources :photos
  end
  
  scope module: :admin do
    resources :photos
    resources :users
  end
  Rails.application.routes.draw do
    # events#index 
    get 'events', to: 'events#index', as: 'events_index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
