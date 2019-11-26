require 'open-uri'
require 'pry'

class Scraper
  def self.scrape_index_page(index_url)

  web = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html"))

  end

  def self.scrape_profile_page(profile_url)

  end

end
student_joe_hash = { :twitter =>"https://twitter.com/jmburges", :linkedin=>"https://www.linkedin.com/in/jmburges",:github=>"https://github.com/jmburges",:blog=>"http://joemburgess.com/", :profile_quote=>"\"Reduce to a previously solved problem\"",:bio=>"I grew up outside of the Washington DC (NoVA!) and went to college at Carnegie Mellon University in Pittsburgh. After college, I worked as an Oracle consultant for IBM for a bit and now I teach here at The Flatiron School."}

Scraper.new(student_joe_hash)
