json.extract! book, :id, :author, :title, :genre, :ownRating, :googleId, :created_at, :updated_at
json.url book_url(book, format: :json)
