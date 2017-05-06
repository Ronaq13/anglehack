


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
    byebug
    # Writing data in database
    display_name = params[:display_name]

    book = Book.new
    book.display_name = display_name
    book.book_name = book_name
    book.user_id = current_user.id
    book.save

    redirect_to '/'
  end


  def download_pdf
    x = params[:id].to_s + "_" + params[:display_name] + ".pdf"

    send_file(
        "#{Rails.root}/public/uploads/users/books/" + x,
        filename: x,
        type: "application/pdf"
    )
  end


end
