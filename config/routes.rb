Rails.application.routes.draw do

  root to: 'homes#top'
  resources :books
  post 'books' => 'books#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
