require 'boogle'

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

  def find_details()
    volume = nil
    if googleId == ""
      googID = get_google_id()
      if googID != ""
        self.googleId = googID
        self.save()
      end
    end
    if googleId != ""
      boogle = Boogle::Client.new(key: Rails.application.credentials.google[:key])
      volume = boogle.volume.find(id: googleId)
    end
    return volume
  end

  def safe_spaces(str)
    chars = str.split ''
    out = ""
    chars.each { |ch| ch == ' '? out += '\\ ': out += ch }
    out
  end

  def get_google_id()
    boogle = Boogle::Client.new(key: Rails.application.credentials.google[:key])
    id = ""
    url = 'https://www.googleapis.com/books/v1/volumes?q='+title+'+inauthor='+author
    response = Faraday.get url
    j = JSON.parse response.body
    j['items'].each do |item|
      vol = boogle.volume.find(id: item['id'])
      if vol.title == title and vol.authors.include? author
        id = item['id']
        break
      end
    end
    id
  end

end
