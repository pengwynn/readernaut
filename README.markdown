# Readernaut

Wrapper for [Readernaut](http://readernaut.com) API, the social book site.

## Installation

  sudo gem install gemcutter
  gem tumble
  sudo gem install readernaut
  
## Usage

  # get a list of books for a user
  books = Readernaut.books('pengwynn')
  books.reader_books.first.book_edition.title
  => 'Crush it!'

  # get a list of notes for a user
  notes = Readernaut.notes('pengwynn')
  
  # get a list of contacts for a user 
  contacts = Readernaut.contacts('pengwynn').contacts
  contacts.last.user.username
  => "blankenship"
  
  # paginate, ordering
  books = Readernaut.books('pengwynn', :page => 3, :order_by => "modified")
  # descending
  books = Readernaut.books('pengwynn', :page => 3, :order_by => "-modified")

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2009 [Wynn Netherland](http://wynnnetherland.com). See LICENSE for details.
