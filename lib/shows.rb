require 'nokogiri'
require 'httparty'
require 'byebug'

class Showlist
    def showlist
        url = 'https://eztv.io/showlist/'
        unparsed_page = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(unparsed_page.body)
        byebug
        shows = []
        # job_listings = parsed_page.css('li.js-job-opening')
        # job_listings.each do |job_listing|
        #   job = {
        #     title: job_listing.css('h1.dst-job-openings__title').text,
        #     url: job_listing.css('a.dst-button')[0].attributes['href'].value
        #   }
        #   jobs << job
        # end
        # puts jobs_json = jobs.to_json
        # local_fname = 'doist-jobs.json'
        # local_file = open(local_fname, 'w')
        # local_file.write(jobs_json)
        # local_file.close
      end
end