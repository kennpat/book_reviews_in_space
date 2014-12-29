require "rails_helper"

feature "User wants to post a new book", %q(
Post a Book

As a user
I want to post a link to a book
So I can share what I'm reading with others

Acceptance Criteria

[] I must provide a title that is at least 1 character long
[] I must provide a description that is at least 10 characters long
[] I must provide a valid URL to the book
[] I must be presented with errors if I fill out the form incorrectly
) do

test_user = User.create(user_name: "The Man on the Moon", email: "test@testing.com", encrypted_password: "12345")





	scenario "user posts a new book" do
		current_user = test_user
		visit "books/new"
		save_and_open_page
		click_on "Sign up"
		# will refactor later to use factory girl
		# book = FactoryGirl.build(:book)
				
		fill_in "Title", with: "Moby Dick"
		fill_in "Description", with: "Captain Ahab chases the beast around the horn."
		fill_in "URL", with: "http://en.wikipedia.org/wiki/Moby-Dick"

		click_on "Submit"

		expect(page).to have_content "Book posted successfully"
		
	end

	scenario "user posts a book incorrectly" do
		

		fill_in "Title", with: ""
		fill_in "Description", with: "Captain"
		fill_in "URL", with: "http://en.wikipedia.org/wiki/Moby-Dick"

		save_and_open_page
		expect(page).to have_content "I'm sorry you need to have at least one character in the title"
		expect(page).to have_content "I'm sorry you need to add more detail to the description"

	end


end
