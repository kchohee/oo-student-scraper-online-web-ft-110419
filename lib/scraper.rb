require 'open-uri'
require 'pry'

class Scraper
  def self.scrape_index_page(index_url)
    student_info=[]
    web = Nokogiri::HTML(open(index_url))
    roster = web.css(".student-card")
    roster.each do |info|
      student_info << {:name => card.css("h4").text, :location => card.css("p").text, :profile_url => card.css("a.href")]}
    end
    student_info
  end

  def self.scrape_profile_page(profile_url)

  end

end
