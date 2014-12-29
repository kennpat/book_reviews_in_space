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

	scenario "user posts a new book" do
		user = FactoryGirl.build(:user)
		book = FactoryGirl.build(:book)
		visit "books/new"
		save_and_open_page
		fill_in "Title", with: book.title
		fill_in "Description", with: book.description
		fill_in "URL", with: book.url
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
