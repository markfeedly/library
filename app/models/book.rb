class Book < ApplicationRecord

  def self.search_author_title(author, title)
    books = []
    if author && (title == "")
      books = Book.where(author: author)
    elsif (author == "") && title
      books = Book.where(title: title)
    else
      books = Book.where(author: author).where(title: title)
    end
  end

end
