require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
  def self.scrape_index_page(index_url)
    student_info=[]
    web = Nokogiri::HTML(open(index_url))
    roster = web.css(".student-card")
    roster.each do |info|
      student_info << {:name=>info.css("h4").text,:location=>info.css("p").text,:profile_url=>info.xpath('a').attr('href')).text.strip}
      binding.pry
    end
    student_info
  end
  def self.scrape_profile_page(profile_url)

  end
end
Scraper.new
Scraper.scrape_index_page("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html")
