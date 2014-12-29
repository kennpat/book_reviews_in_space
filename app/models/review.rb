class Review < ActiveRecord::Base

	belongs_to :user
	belongs_to :book

	validates :review, presence: true, length: {minimum: 50, too_short: "Please add more detail to your review"}

end