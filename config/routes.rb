Rails.application.routes.draw do
  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: %i[new create]
  end
  delete '/bookmarks/:id', to: 'bookmarks#destroy', as: 'bookmark'
  root 'lists#index'
end
