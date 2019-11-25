require 'open-uri'
require 'pry'

class Scraper
   attr_accessor :name, :location, :profile_quote, :bio, :twitter, :linkedin, :github, :blog, :profile_url
   def initialize(student_hash)
     student_hash.each {|k,v| self.send("#{k}=", v)}
   end
   
  def self.scrape_index_page(index_url)
    
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

