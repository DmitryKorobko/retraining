# frozen_string_literal: true

class LoansController < ApplicationController
  before_action :set_loan, only: %i[show edit update destroy]
  before_action :set_books_and_customers, only: %i[new create edit]
  before_action :authenticate_user!, :librarian_check
  skip_before_action :librarian_check, only: %i[index new create show]

  # GET /loans or /loans.json
  def index
    if current_user.librarian?
      @loans = Loan.includes(:book, :user)
    else
      @loans = Loan.includes(:book, :user).where(user_id: current_user.id)
    end
  end

  # GET /loans/1 or /loans/1.json
  def show; end

  # GET /loans/new
  def new
    @loan = Loan.new
  end

  # GET /loans/1/edit
  def edit; end

  # POST /loans or /loans.json
  def create
    @loan = Loan.new(loan_params)

    respond_to do |format|
      if @loan.save
        book = @loan.book
        book.decrement(:quantity)
        book.save
        format.html { redirect_to @loan, notice: 'Loan was successfully created.' }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1 or /loans/1.json
  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to @loan, notice: 'Loan was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1 or /loans/1.json
  def destroy
    book = @loan.book
    @loan.destroy
    book.increment(:quantity)
    book.save
    respond_to do |format|
      format.html { redirect_to loans_url, notice: 'Loan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_loan
    @loan = Loan.find(params[:id])
  end

  def set_books_and_customers
    @books = Book.all
    @customers = Customer.all
  end

  # Only allow a list of trusted parameters through.
  def loan_params
    params.require(:loan).permit(:book_id, :user_id, :period)
  end
end
