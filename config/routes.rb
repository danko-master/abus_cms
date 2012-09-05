CmsAbus2::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'


    #путь к главной странице
    root :to => 'sessions#new'
    
    get "main/show" # Для второго меню
    
    #пути к ресурсам контроллеров      
    resources :main
    resources :cars do
      collection { post :update_domain, :destroy_domain }
    end 
    resources :images do
      collection { post :upload_image, :sort }
    end 
    resources :pages
    resources :domains
      match '/newdomain',  :to => 'domains#new'
    
    resources :users
      match '/registration',  :to => 'users#new'


    resources :sessions, :only => [:new, :create, :destroy]    
      match '/signup',  :to => 'users#new'
      match '/signin',  :to => 'sessions#new'
      match '/signout', :to => 'sessions#destroy'
      
   namespace :ckeditor do
      resources :pictures, :only => [:index, :create, :destroy]
      resources :attachment_files, :only => [:index, :create, :destroy]
      resources :attachments, :only => [:index, :create, :destroy]
    end
    
    
    match "/vehicle/:alias", :to => 'cars#show', :as => 'vehicle' # псевдоним для машин, дабы отображать по seo- user- friendly url

    
end
