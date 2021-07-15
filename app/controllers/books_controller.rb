# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  before_action :set_authors_and_genres, only: %i[new create edit]
  before_action :authenticate_user!, :librarian_check
  skip_before_action :authenticate_user!, only: %i[index show]
  skip_before_action :librarian_check, only: %i[index show]

  # GET /books or /books.json
  def index
    if user_signed_in? && current_user.librarian?
      books = Book.includes(:author, :genres)
    else
      books = Book.joins(:author, :genres)
    end

    if params[:filter_author].present?
      author = params[:filter_author].downcase
      books = books.where("lower(authors.first_name) LIKE '%#{author}%' OR lower(authors.last_name) LIKE '%#{author}%'")
    end

    if params[:filter_title].present?
      title = params[:filter_title].downcase
      books = books.where("lower(title) LIKE '%#{title}%'")
    end

    @books = books

    # respond_to do |format|
    #   format.html { redirect_to books_path, notice: 'Filters applied.' }
    #   format.json { render :index, status: :accepted, location: books_path }
    # end
  end

  # GET /books/1 or /books/1.json
  def show
    customers = []
    loans = Loan.includes(:user).where(book_id: @book.id)

    loans.each do |l|
      customers << (helpers.link_to l.user.full_name, user_path(l.user)).html_safe
    end

    @customers = customers.join(', ')
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit; end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  def set_authors_and_genres
    @authors = Author.all
    @genres = Genre.all
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :author_id, :year, :quantity, genre_ids: [])
  end
end
