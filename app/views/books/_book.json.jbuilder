json.extract! book, :id, :author, :name, :genre, :ownRating, :googleId, :created_at, :updated_at
json.url book_url(book, format: :json)
