SocialMovies::Application.routes.draw do
  resources :forums do
    collection do
      get 'index'
      get 'load'
    end
  end

  resources :movies


  root :to => 'movies#index'

end
