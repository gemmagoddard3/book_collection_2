class Book < ApplicationRecord
    validates :title, :author, :published_date, :price, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
end
