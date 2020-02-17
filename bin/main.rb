require 'nokogiri'
require 'httparty'
require 'byebug'
require 'json'
require "tty-prompt"
require 'nikkou'

require_relative '../lib/shows.rb'



# def number_of_shows
#     total_shows = parsed_page.css('td.forum_thread_post').count / 3
#     if total_shows == 0
#         false
#     else
#         total_shows
#     end
# end

def parser
    url = 'https://eztv.io/showlist/'
    unparsed_page = HTTParty.get(url)
    @parsed_page = Nokogiri::HTML(unparsed_page.body)
end

def showlist
    parser
    total_shows = @parsed_page.css('td.forum_thread_post').count / 3
    shows = []
    # (0..total_shows).each do |x|
    #     show = {
    #         show_title:  parsed_page.css('td.forum_thread_post')[x * 3].text,
    #         show_url: 'https://eztv.io' + parsed_page.css('td.forum_thread_post')[x * 3].css('a').attribute('href').value
    #     }
    #     puts x
    #     shows << show
    # end
    # shows_json = shows.to_json
    # local_fname = 'showlist.json'
    # local_file = open(local_fname, 'w')
    # local_file.write(shows_json)
    # local_file.close
    (0..5).each do |x|
        show = @parsed_page.css('td.forum_thread_post')[x * 3].text
        shows << show
    end
    return shows
end

def select_show
    parser
    prompt = TTY::Prompt.new
    show = prompt.select("Select a TV show?", showlist, filter: true)
    puts 'https://eztv.io' + @parsed_page.search('a').text_includes(show).attribute('href').value
end

select_show