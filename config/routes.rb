Rails.application.routes.draw do

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  resources :equipments, :path => "equipamentos", :path_names => {:new => 'novo'}

  resources :clients, :path => "clientes", :path_names => {:new => 'novo'}

  resources :users, :path => "usuarios", :path_names => {:new => 'novo'}

  resources :tickets, :path => "chamados", :path_names => {:new => 'novo'}

  root 'home#index'

end
