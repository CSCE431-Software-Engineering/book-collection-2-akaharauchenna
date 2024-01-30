class BooksController < ApplicationController
  def index
    @books = Book.order(:id)
  end

  def new
    @book = Book.new()
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to books_path
    else
      #this goes to the new view, not the function
      render('new')
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to books_path
    else
      render('edit')
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = 'Book was successfully deleted.'
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title, :author, :price, "published_date(1i)", "published_date(2i)", "published_date(3i)")
  end

end
