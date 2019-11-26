require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
  def self.scrape_index_page(index_url)
    student_info=[]
    web = Nokogiri::HTML(open(index_url))
    roster = web.css(".student-card")
    roster.each do |info|
      student_info << {:name=>info.css("h4").text,:location=>info.css("p").text,:profile_url=>info.xpath('a').attr('href').text.strip}
      # binding.pry
    end
    student_info
  end
  def self.scrape_profile_page(profile_url)
    profile_info={}
    web = Nokogiri::HTML(open(profile_url)
    profile = web.xpath('a').attr('href').text.strip
    profile.each do |info|
      case info
      when info.attr("href").include?("twitter")
        profile_info[:twitter]=info.xpath('a').attr('href').text.strip
      when info.attr("href").include?
        profile_info[:linkedin]
      when info.attr("href").include?
        profile_info[:github]
      when info.attr("href").include?
        profile_info[:blog]
      end
      profile_info[:profile_quote]=
      profile_info[:bio] =
    end
  end
end
# Scraper.new
# Scraper.scrape_index_page("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html")
