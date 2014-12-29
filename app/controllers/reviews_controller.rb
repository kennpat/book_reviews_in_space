class ReviewsController < AppliationController

	before_action :authenticate_user!, only: [:destroy, :delete, :new, :create, :edit, :update]

	


end