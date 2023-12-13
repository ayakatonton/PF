Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  
  namespace :public do
    get 'calendar/index'
    resources :sessions, only: [:new, :create, :destroy]
  end
  
  resources :groups, only:  [:new, :index, :show, :create, :edit, :update] do
    resource :group_users, only: [:create, :destroy]
  end
  
  scope module: :public do
    root 'homes#top'
    get 'about'=>"homes#about"
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

    # events#index 
    get 'events', to: 'events#index', as: 'events_index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
