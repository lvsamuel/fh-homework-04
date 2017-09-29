class BooksController < ApplicationController
     before_action :authenticate_user!, only: [:new, :create, :destroy]
     
    def index
        @books = Book.all.page params[:page]
        @author =Author.all
    end
    
    def new
        @book=Book.new  
    end
    
    def create
        Book.create(book_params)
        redirect_to root_path
    end
    
    def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path
    end
    
    def show
        @book = Book.find(params[:id])
    end
    
    def edit
        @book = Book.find(params[:id])
    end
    
    def update
        @book = Book.find(params[:id])
        @book.update_attributes(book_params)
        redirect_to root_path
    end
    
    private
    def book_params
     params.require(:book).permit(:title, :genre, :classification, :book_type, :year)
    end     
end
