Rails.application.routes.draw do

  devise_for :users
  get '/' => 'main#index'
  get '/upload' => 'main#upload'



  post '/uploading_book' => 'main#uploading_book'
  post '/download_mp3/:id/:display_name' => 'main#download_mp3'
  post '/download_pdf/:id/:display_name' => 'main#download_pdf'


end
