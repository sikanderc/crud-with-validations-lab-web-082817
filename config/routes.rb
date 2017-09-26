Rails.application.routes.draw do

  resources :songs, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # get "/artists/new", to: "artists#new", as: "new_artist"
  # get "/artists/:id", to: "artists#show", as: "artist"
  # post "/artists", to: "artists#create"
  #
  # get "/songs/new", to: "songs#new", as: "new_song"
  # get "/songs/:id", to: "songs#show", as: "song"
  # get "/songs/:id/edit", to: "songs#edit", as: "edit_song"
  # patch "/songs/:id", to: "songs#update"
end
