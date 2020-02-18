require 'nokogiri'
require 'httparty'
require 'byebug'
require 'json'
require "tty-prompt"
require 'nikkou'
require 'tty-progressbar'
require 'pastel'
require 'tty-spinner'

require_relative '../lib/shows.rb'

def list_parser
    spinner = TTY::Spinner.new("[:spinner] Parsing EZTV", format: :dots, success_mark: '+')
    spinner.auto_spin
    eztv = 'https://eztv.io/showlist/rating/'
    unparsed_showlist = HTTParty.get(eztv)
    @parsed_showlist = Nokogiri::HTML(unparsed_showlist.body)
    spinner.success('(✔ Successful)')
    spinner.error('(✖ Error)')
    puts ''
end

def showlist
    list_parser
    shows = []
    pastel = Pastel.new
    complete = pastel.on_green(" ")
    incomplete = pastel.on_red(" ")
    bar = TTY::ProgressBar.new("Grabbing your favorite shows! [:bar]", total: 10, width: 100, complete: complete, incomplete: incomplete)
    (0...10).each do |x|
        shows << show = @parsed_showlist.css('td.forum_thread_post')[x * 3].text
        bar.advance(1)
    end
    sleep(2)
    puts `clear`
    shows
end


def select_show
    prompt = TTY::Prompt.new
    show = prompt.select("Select a TV show?", showlist, filter: true, per_page: 20)
    @series_link = 'https://eztv.io' + @parsed_showlist.search('a').text_includes(show).attribute('href').value
    puts " Fantastic Choice! "
    show_info
end

def parsed_show
    url = @series_link
    unparsed_page = HTTParty.get(url)
    @parsed_page = Nokogiri::HTML(unparsed_page.body)
end

def show_info
    parsed_show
    @output = []
    show_info = {
        title: @parsed_page.css('td.section_post_header span').text,
        description: @parsed_page.css('td.show_info_banner_logo p').text,
        poster: @parsed_page.css('td.show_info_main_logo').children.css('img').attribute('src').value,
        imdb_rating: @parsed_page.css('td.show_info_rating_score div')[1].css('b span').text
        }
    @output << show_info
    puts 'added info'
    episodes_info
end

def episodes_info
    itemcount = @parsed_page.css('tr.forum_header_border').count - 1
    puts 'counted'
    (0..itemcount).each do |x|
        ep = {
        episode_name: @parsed_page.css('tr.forum_header_border')[x].css('td.forum_thread_post')[1].css('a').text,
        magnet: @parsed_page.css('tr.forum_header_border')[x].css('td.forum_thread_post')[2].css('a')[0].attribute('href').value,
        size: @parsed_page.css('tr.forum_header_border')[x].css('td.forum_thread_post')[3].text,
        released: @parsed_page.css('tr.forum_header_border')[x].css('td.forum_thread_post')[4].text,
        seeds: @parsed_page.css('tr.forum_header_border')[x].css('td.forum_thread_post_end').text,
        }
        @output << ep
    end
    json_output
end

def json_output
    magnets = @output.to_json
    local_fname = 'bb.json'
    local_file = open(local_fname, 'w')
    local_file.write(magnets)
    local_file.close
end

# def redo

# end

select_show