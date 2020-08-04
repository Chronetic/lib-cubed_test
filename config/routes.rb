Rails.application.routes.draw do
	root 'pages#home'
	devise_for :users
  resources :shows
  resources :movies
  resources :comics
  resources :books
	resources :pages
	resources :users, only: [:show, :index]

	controller :movies do
		get :create_movie
	end

	controller :pages do
		get :home
		get :about
		get :contact
	end

end
