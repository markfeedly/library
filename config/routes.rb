Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books

  get '/search_books', action: 'search_books', controller: 'books'
  post '/do_search', action: 'do_search', controller: 'books'




end


