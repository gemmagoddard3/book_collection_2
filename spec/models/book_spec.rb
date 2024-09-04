require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'is valid with all attributes present' do
    book = Book.new(title: 'The Giver', author: 'Lois Lowry', published_date: '2023-04-23', price: 10.99)
    expect(book).to be_valid
  end

  it 'is not valid without a title' do
    book = Book.new(title: nil, author: 'Lois Lowry', published_date: '2023-04-23', price: 10.99)
    expect(book).to_not be_valid
  end

  it 'is not valid without an author' do
    book = Book.new(title: 'The Giver', author: nil, published_date: '2023-04-23', price: 10.99)
    expect(book).to_not be_valid
  end

  it 'is not valid without a price' do
    book = Book.new(title: 'The Giver', author: 'Lois Lowry', published_date: '2023-04-23', price: nil)
    expect(book).to_not be_valid
  end

  it 'is not valid without a published_date' do
    book = Book.new(title: 'The Giver', author: 'Lois Lowry', published_date: nil, price: 10.99)
    expect(book).to_not be_valid
  end
end
