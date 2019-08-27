Rails.application.routes.draw do
  get '/welcome/home'
  
  root 'welcome#home'

  get '/auth/facebook/callback' => 'sessions#create'
end
