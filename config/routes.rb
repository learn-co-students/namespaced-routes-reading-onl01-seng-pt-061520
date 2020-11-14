Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  #1) get '/admin/stats', to: 'stats#index'

 # 2) scope '/admin' do
  #  resources :stats, only: [:index]
  #end

  #3) scope '/admin', module: 'admin' do
    #resources :stats, only: [:index]
  #end

  #4
  namespace :admin do
    resources :stats, only: [:index]
  end
  root 'posts#index'
end
