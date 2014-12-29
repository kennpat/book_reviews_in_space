class BooksController < ApplicationController

	def index
		@books = Book.order(:created_at)
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(user_params)
		if @book.save
			redirect_to "/books"
		else
			render "new"
		end
	end

	def show
		@book = Book.find_by(id: params[:id])

	end

	def delete

	end

	private

	def user_params
		params.require(:book).permit(:title, :description, :url)
	end

end
