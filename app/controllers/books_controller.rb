class BooksController < ActiveRecord::Base

	def index
		@books = Book.order(created_at: :description)
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(user_params)
		if @book.save
			redirect_to books_index
		else
			render 'new'
		end
	end

	def show

	end

	def delete

	end

	private

	def user_params
		params.require(:book).permit(:title, :description, :url)
	end

end
