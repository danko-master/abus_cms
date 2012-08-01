CmsAbus2::Application.routes.draw do
  
  get "sessions/new"
  get "domains/new"
  get "users/new"

    #путь к главной странице
    root :to => 'sessions#new'
    
    #роутинг меню для страницы приветствия
    get "domains/show"
    get "main/show"
    get "index/show"

    #пути к ресурсам контроллеров      
    resources :main
    resources :domains
      match '/newdomain',  :to => 'domains#new'
    
    resources :users
      match '/registration',  :to => 'users#new'


    resources :sessions, :only => [:new, :create, :destroy]    
      match '/signup',  :to => 'users#new'
      match '/signin',  :to => 'sessions#new'
      match '/signout', :to => 'sessions#destroy'
    
end
