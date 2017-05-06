Rails.application.routes.draw do

  devise_for :users
  get '/' => 'main#index'
  get '/upload' => 'main#upload'



  post '/uploading_book' => 'main#uploading_book'


end
