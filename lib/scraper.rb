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
      if info.attr("href").include?("twitter")
        profile_info[:twitter]=info.attribute('href').value
      elsif info.attr("href").include?("linkedin")
        profile_info[:linkedin]=info.attribute('href').value
      elsif info.attr("href").include?("github")
        profile_info[:github]=info.attribute('href').value
      else
        profile_info[:blog]=info.attribute('href').value
      end
    end
    profile_info[:profile_quote]=web.css(".profile-quote").text
    profile_info[:bio]=web.css(".description-holder p")[0].text
    profile_info
  end
end
