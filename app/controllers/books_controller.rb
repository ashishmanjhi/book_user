# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :find_book, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @books = Book.all.order('created_at DESC')
  end

  def new
    @book = current_user.books.build
  end

  def show; end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to root_path, notice: 'Successfully created new Book'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated'
    else
      render 'edit'
  end
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :publisher, :year, :place, :author, :description)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
