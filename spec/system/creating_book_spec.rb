require 'rails_helper'

RSpec.describe "Books", type: :system do
  before do
    driven_by(:rack_test) # Change to :selenium_chrome if JavaScript is involved
  end

  describe 'creating a new book' do
    it 'navigates to the new book form, fills it out, and submits it' do
      visit '/books/new'

      expect(page).to have_link('Back to List', href: books_path)
      click_link 'Back to List'
      expect(page).to have_current_path(books_path)

      visit '/books/new'

      find('#book_title').set('The Giver')  
      find('#book_author').set('Lois Lowry')  
      find('#book_price').set('10.99') 
      select '23', from: 'book_published_date_3i' 
      select 'April', from: 'book_published_date_2i'
      select '2023', from: 'book_published_date_1i'

      click_button 'Add Book'

      # flash notice
      expect(page).to have_content('Book was successfully created.')

      expect(page).to have_content('The Giver')
      expect(page).to have_content('Lois Lowry')

      book = Book.order("id").last
      expect(book.title).to eq('The Giver')
      expect(book.author).to eq('Lois Lowry')
      expect(book.price).to eq(10.99)
      expect(book.published_date.to_s).to eq('2023-04-23')
    end

    it 'shows an error when submitting a form without title' do
      # Visit the new book form page
      visit '/books/new'

      # Leave the title blank and submit the form
      find('#book_author').set('Lois Lowry')  
      find('#book_price').set('10.99') 
      select '23', from: 'book_published_date_3i' 
      select 'April', from: 'book_published_date_2i'
      select '2023', from: 'book_published_date_1i'

      # Submit the form
      click_button 'Add Book'

      # Verify the flash notice for error is displayed
      expect(page).to have_content('There was an error creating the book.')
    end

    it 'shows an error when submitting a form without author' do
      # Visit the new book form page
      visit '/books/new'

      # Leave the title blank and submit the form
      find('#book_title').set('The Giver')  
      find('#book_price').set('10.99') 
      select '23', from: 'book_published_date_3i' 
      select 'April', from: 'book_published_date_2i'
      select '2023', from: 'book_published_date_1i'

      # Submit the form
      click_button 'Add Book'

      # Verify the flash notice for error is displayed
      expect(page).to have_content('There was an error creating the book.')
    end

    it 'shows an error when submitting a form without price' do
      # Visit the new book form page
      visit '/books/new'

      # Leave the title blank and submit the form
      find('#book_title').set('The Giver')  
      find('#book_author').set('Lois Lowry')  
      select '23', from: 'book_published_date_3i' 
      select 'April', from: 'book_published_date_2i'
      select '2023', from: 'book_published_date_1i'

      # Submit the form
      click_button 'Add Book'

      # Verify the flash notice for error is displayed
      expect(page).to have_content('There was an error creating the book.')
    end

    it 'shows an error when submitting a form with negative price' do
      # Visit the new book form page
      visit '/books/new'

      # Leave the title blank and submit the form
      find('#book_title').set('The Giver')  
      find('#book_price').set('-10.99') 
      find('#book_author').set('Lois Lowry')  
      select '23', from: 'book_published_date_3i' 
      select 'April', from: 'book_published_date_2i'
      select '2023', from: 'book_published_date_1i'

      # Submit the form
      click_button 'Add Book'

      # Verify the flash notice for error is displayed
      expect(page).to have_content('There was an error creating the book.')
    end


    it 'shows an error when submitting a form without a date' do
      # Visit the new book form page
      visit '/books/new'

      # Leave the title blank and submit the form
      find('#book_title').set('The Giver')  
      find('#book_author').set('Lois Lowry')  
      find('#book_price').set('10.99') 

      # Submit the form
      click_button 'Add Book'

      # Verify the flash notice for error is displayed
      expect(page).to have_content('There was an error creating the book.')
    end
  end
end
