class ReviewsController < AppliationController

	before_action :authenticate_user!, only: [:destroy, :delete, :new, :create, :edit, :update]

	def new
		@book = Book.find(params[:book_id])
		@review = Review.new
	end

	def create
		@book = Book.find(params[:id])
		@review = Review.new(filtered_params)
		@review.user_id = current_user.id
		@review.book_id = @book.id

		if @review.save
			redirect_to "/books/#{@book.id}"
		else
			flash ("Your review was not saved!")
			redirect_to "/books/#{@book.id}"
		end
	end

	def edit
		@review = Review.find(:filtered_params)
	end

	def delete
		@review = Review.find_by(id: params[:id])
		@review.destroy
	end

	private

	def filtered_params
		params.require(:review).permit(:review)
	end

end