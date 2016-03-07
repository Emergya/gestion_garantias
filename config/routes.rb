# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
RedmineApp::Application.routes.draw do
	scope '/projects/:project_id/', :as => "project" do
		
		match 'gestion_garantias', to: 'gg_files#index', as: 'gg_home'

		resources :csme_files, :controller => 'gg_files', :as => 'gg_files' do
			resources :articles, :controller => 'gg_articles', :as => 'gg_articles' do
				get :copy, on: :member
				resources :contacts, :controller => 'gg_contacts', :as => 'gg_contacts'
				resources :ans, :controller => 'gg_ans', :as => 'gg_ans'
			end
		end
	end

	# Ruta para comprobar si existe un usuario con un determinado e-mail a través de AJAX
	get '/find_user', to: 'gg_articles#find_user', as: 'find_user'

	# Ruta para crear un usuario mediante el modal a través de AJAX
	get '/modal_create_user', to: 'gg_articles#modal_create_user', as: 'modal_create_user'
end