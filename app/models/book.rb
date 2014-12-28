class Book < ActiveRecord::Base
	belongs_to :user
	has_many :reviews

	validates :title, presence: true, length: {minimum: 1, too_short: "I'm sorry you need to have at least one character in the title"}
	validates :description, presence: true, length: {minimum: 50, too_short: "I'm sorry you need to add more detail to the description"}
	validates :url, presence: true, 


end