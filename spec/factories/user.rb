FactoryGirl.define do 
	factory :user do
		user_name "Major Tom"
		sequence :email do |n|

			email "lost#{n}@inspace.com"

		end

			role "Candidate"
			password "groundcontrolstinks"

	end

	factory :book do
		sequence :title do
			title "Moby Dick#{n}"
		end

		description "Captain Ahab chases the beast around the horn."
		url "http://en.wikipedia.org/wiki/Moby-Dick"

	end

	factory :review do
		review "this book rocks, it will give you some insight into the late 1800s when Nantucket was the whaling 
		capital of the world... as well as some insight as to the madness that can drive men to do great and 
			terrible things"
		book
		user
	end

	
end


