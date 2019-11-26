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
    end
    student_info
  end
  def self.scrape_profile_page(profile_url)
    profile_info={}
    web = Nokogiri::HTML(open(profile_url))
    profile = web.css("div.social-icon-container a")
    profile.each do |info|
      profile_info[:profile_quote]=info.css(".vitals-text-container .profile-quote").text
      profile_info[:bio]=info.css(".description-holder p").text
      case true
      when info.attr("href").include?("twitter")
        profile_info[:twitter]=info.attribute('href').value
      when info.attr("href").include?("linkedin")
        profile_info[:linkedin]=info.attribute('href').value
      when info.attr("href").include?("github")
        profile_info[:github]=info.attribute('href').value
      when info.attr("href").include?("blog")
        profile_info[:blog]=info.attribute('href').value
      end
    end
    profile_info
  end
end

Scraper.new
Scraper.scrape_profile_page("https://learn-co-curriculum.github.io/student-scraper-test-page/students/joe-burgess.html")
