class BooksController < ApplicationController
  def new
    @list = Book.new #後で消すかも
  end

  def index
    @list = Book.new  #新規投稿用のインスタンス変数
    @lists = Book.all
  end

  def show
    @list = Book.find(params[:id])
  end

  def edit
    @list = Book.find(params[:id])
  end

  def update
    list = Book.find(params[:id])
    list.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(list.id)
  end

  def create
    @list = Book.new(book_params)
    if @list.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@list.id)
    else
      @lists = Book.all
      render :index
    end
  end

  def destroy
    list = Book.find(params[:id])
    list.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
