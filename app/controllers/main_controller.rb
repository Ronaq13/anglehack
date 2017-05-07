class MainController < ApplicationController
  def index
  end

  def upload
  end

  def uploading_book



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
    book.display_content = ""
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

  def remove
    bookName = params[:book_name] + '.pdf'
    book = Book.find_by_book_name(bookName)
    book.destroy
    book.save

    remove_files_also (bookName)
    redirect_to '/'
  end

  def remove_files_also (bookName)

    File.delete("#{Rails.root}/public/uploads/users/books/" + bookName)
    bookName.slice! '.pdf'
    audioName = bookName + '.mp3'

    File.delete("#{Rails.root}/public/uploads/users/audios/" + audioName)
  end


  def update_profile

  end

  def updating_user

    actual_photo = params[:profile_pic]

    profile_pic_name = current_user.id.to_s + '.' + actual_photo.original_filename.split(".")[1]

    File.open("#{Rails.root}/public/uploads/users/profile_pics/" + profile_pic_name, 'wb') do |file|
      file.write(actual_photo.read)
    end
    u = User.find(current_user.id)
    u.user_name= params[:user_name]

    u.profile_pic= profile_pic_name
    u.save
    redirect_to '/'

  end


end
