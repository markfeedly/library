class Book < ApplicationRecord

  def self.search_author_title(author, title, genre)
    books = Book.all # whoa! bad practice but easy to do

    if author != ""
      books = Book.where("author LIKE ?", "%#{author}%")
    end
    if title != ""
      books = books.where("title LIKE ?", "%#{title}%")
    end
    if genre != ""
      books = books.where("genre LIKE ?", "%#{genre}%")
    end
    books
  end

end
