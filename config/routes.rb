Rails.application.routes.draw do
  get '/author/:id', to: "author#show", as: 'author'
  devise_for :authors
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles do
    resources :comments
  end

  root "welcome#index"
end
