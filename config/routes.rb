Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :categories, only: [:index, :create]
      resources :feeds, only: [:index, :create]
      get 'feeds/:id/news', to: 'news#index'
      get 'feeds/refresh', to: 'feeds#update_feeds'
      get 'news', to: 'news#filter'
      get 'news/:id', to: 'news#show'
    end
  end
end
