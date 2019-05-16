class Book < ApplicationRecord

  def self.search_author_title(author, title, genre)
    books = Book.all # whoa! bad practice but easy to do

    if author != ""
      books = Book.where(author: author)
    end
    if title != ""
      books = books.where(title: title)
    end
    if genre != ""
      books = books.where(genre: genre)
    end
    books
  end

end
