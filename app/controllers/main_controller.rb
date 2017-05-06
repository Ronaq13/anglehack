class MainController < ApplicationController
  def index
  end

  def upload
  end

  def uploading_book

    byebug

    #uploading file
    actual_book = params[:actual_book]
    book_name = current_user.id.to_s + "_" + params[:display_name] + ".pdf"

    File.open(Rails.root.join('public', 'uploads','users','books', book_name), 'wb') do |file|
      file.write(actual_book.read)
    end

    # Writing data in database
    display_name = params[:display_name]

    book = Book.new
    book.display_name = display_name
    book.book_name = book_name
    book.user_id = current_user.id
    book.save
    #generating mp3
    generatingMP3(book_name,display_name)
    redirect_to '/'
  end



  def generatingMP3 (x,display_name)

    y = Yomu.new("#{Rails.root}/public/uploads/users/books/" + x).text

    musicFileName = current_user.id.to_s + "_" + display_name + "." + "mp3"
    y.to_file "en", "#{Rails.root}/public/uploads/users/audios/" + musicFileName
  end


  def download_pdf
    x = params[:id].to_s + "_" + params[:display_name] + ".pdf"

    send_file(
        "#{Rails.root}/public/uploads/users/books/" + x,
        filename: x,
        type: "application/pdf"
    )
  end

  def download_mp3
    x = params[:id].to_s + "_" + params[:display_name] + ".mp3"

    send_file(
        "#{Rails.root}/public/uploads/users/audios/" + x,
        filename: x,
        type: "mp3"
    )
  end




end
