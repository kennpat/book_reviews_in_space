

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
		visit book_new
		book = FactoryGirl.build(:book)
		fill_in "Title", with: book.title
		fill_in "Description", with: book.description
		fill_in "Book URL", with: book.url 

		click_on "Submit"

		expect(page).to have_content "Book posted successfully"
		
	end

end
