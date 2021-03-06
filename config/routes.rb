Rails.application.routes.draw do
  root 'welcome#show'

  get '/user', to: 'users#show'

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
