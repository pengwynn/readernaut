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
    path = "/#{username}/books/"
    list = options.delete(:list)
    path += "#{list}/" unless list.blank?
    Mash.new self.get(path, :query => options)
  end

  def self.books_finished(username, options={})
    opts = options.merge({:list => 'finished'})
    self.books(username, opts)
  end
  
  def self.books_reading(username, options={})
    opts = options.merge({:list => 'reading'})
    self.books(username, opts)
  end
  
  def self.books_plan_to_read(username, options={})
    opts = options.merge({:list => 'plan-to-read'})
    self.books(username, opts)
  end
  
  def self.books_reference(username, options={})
    opts = options.merge({:list => 'reference'})
    self.books(username, opts)
  end
  
  def self.books_wishlist(username, options={})
    opts = options.merge({:list => 'wishlist'})
    self.books(username, opts)
  end
  
  def self.books_abandoned(username, options={})
    opts = options.merge({:list => 'abandoned'})
    self.books(username, opts)
  end

  def self.notes(username, options={})
    Mash.new self.get("/#{username}/notes/", :query => options)
  end
  
  def self.contacts(username, options={})
    Mash.new self.get("/#{username}/contacts/", :query => options)
  end
end