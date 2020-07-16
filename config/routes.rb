Rails.application.routes.draw do
	root 'pages#home'
	devise_for :users
  resources :shows
  resources :movies
  resources :comics
  resources :books
	resources :pages


	controller :pages do
		get :home
		get :about
		get :contact
	end

end
