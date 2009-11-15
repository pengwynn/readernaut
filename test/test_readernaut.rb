require 'helper'

class TestReadernaut < Test::Unit::TestCase
  context "When hitting the Readernaut API" do

    should "retrieve a list of books for a user" do
      stub_get "http://readernaut.com/api/v1/json/pengwynn/books/", "books.json"
      results = Readernaut.books('pengwynn')
      edition = results.reader_books.first.book_edition
      edition.title.should == 'The Housing Boom and Bust'
      edition.isbn.should == '0465018807'
      edition.covers.cover_large.should == 'http://media.readernaut.com/book_covers/0465018807_t150.jpg'
    end
    
    should "retrieve a list of notes for a user" do
      stub_get "http://readernaut.com/api/v1/json/pengwynn/notes/", "notes.json"
      results = Readernaut.notes('pengwynn')
      note = results.notes.last
      note.note_id.should == 8024
      note.tags.should == 'drugs, giving, experience'
    end
    
    should "retrieve a list of contacts for a user" do
      stub_get "http://readernaut.com/api/v1/json/pengwynn/contacts/?page=2", "contacts.json"
      results = Readernaut.contacts('pengwynn', :page => 2)
      results.page.should == 2
      results.contacts.first.user.username.should == 'spacecowboyian'
    end
  end
  
end
