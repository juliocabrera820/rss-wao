Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'categories', to: 'categories#create'
      resources :feeds, only: [:index, :create]
      get 'feeds/:id/news', to: 'news#index'
      get 'feeds/refresh', to: 'feeds#update_feeds'
    end
  end
end
