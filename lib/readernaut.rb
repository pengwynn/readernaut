require 'rubygems'

gem 'mash', '~> 0.0.3'
require 'mash'

gem 'httparty', '~> 0.4.3'
require 'httparty'

class Readernaut
  include HTTParty
  base_uri 'readernaut.com/api/v1/json'
  format :json
  
  def self.books(username, options={})
    Mash.new self.get("/#{username}/books/", :query => options)
  end
  
  def self.notes(username, options={})
    Mash.new self.get("/#{username}/notes/", :query => options)
  end
  
  def self.contacts(username, options={})
    Mash.new self.get("/#{username}/contacts/", :query => options)
  end
end