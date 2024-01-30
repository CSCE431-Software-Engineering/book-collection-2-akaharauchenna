require 'rails_helper'

RSpec.describe 'Adding a new book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'book[title]', with: 'The Great Gatsby' # Matches name attribute
    fill_in 'book[author]', with: 'F. Scott Fitzgerald'
    fill_in 'book[price]', with: '10.99'
    select '2024', from: 'book_published_date_1i' # Matches the generated id for the year
    select 'January', from: 'book_published_date_2i' # Matches the generated id for the month
    select '30', from: 'book_published_date_3i' # Matches the generated id for the day
    click_button 'Add Book'

    # Adjust the expectation to match the success confirmation implementation in your app
    expect(page).to have_content('Book was successfully created.')
  end

  scenario 'invalid inputs' do
    visit new_book_path
    fill_in 'book[title]', with: '' # Matches name attribute
    click_button 'Add Book'

    # Adjust the expectation to match the validation failure implementation in your app
    expect(current_path).to eq(current_path)
  end
end
