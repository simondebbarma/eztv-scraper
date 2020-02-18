require 'nokogiri'
require 'httparty'
require 'byebug'
require 'json'
require 'tty-prompt'
require 'nikkou'
require 'tty-progressbar'
require 'pastel'
require 'tty-spinner'
require 'tty-font'
require 'io/console'  

require_relative '../lib/shows.rb'

@pastel = Pastel.new

def list_parser
    spinner = TTY::Spinner.new('[:spinner] Parsing EZTV', format: :dots, success_mark: '+')
    spinner.auto_spin
    eztv = 'https://eztv.io/showlist/rating/'
    unparsed_showlist = HTTParty.get(eztv)
    @parsed_showlist = Nokogiri::HTML(unparsed_showlist.body)
    spinner.success(@pastel.blue('(✔ Successful)'))
    spinner.error(@pastel.red('(✖ Error)'))
    puts ''
end

def showlist
    list_parser
    shows = []
    complete = @pastel.on_green(' ')
    incomplete = @pastel.on_red(' ')
    bar = TTY::ProgressBar.new('Grabbing your favorite shows [:bar]', total: 10, width: 50, complete: complete, incomplete: incomplete)
    (0...30).each do |x|
        shows << show = @parsed_showlist.css('td.forum_thread_post')[x * 3].text
        bar.advance(1)
    end
    puts ''
    shows
end

def select_show
    prompt = TTY::Prompt.new
    puts ''
    show = prompt.select(@pastel.magenta(" Select a TV show?"), showlist, filter: true, per_page: 20)
    @series_link = 'https://eztv.io' + @parsed_showlist.search('a').text_includes(show).attribute('href').value
    puts " Fantastic Choice!"
    puts ''
    show_info
    puts ''
    episodes_info
    puts ''
    puts @pastel.green(' ~ Thank you for using eztv-scraper! Fork the project and build upon it! ~')
end

def parsed_show
    spinner = TTY::Spinner.new("[:spinner] Searching the database!", format: :dots, success_mark: '+')
    spinner.auto_spin
    url = @series_link
    unparsed_page = HTTParty.get(url)
    @parsed_page = Nokogiri::HTML(unparsed_page.body)
    spinner.success(@pastel.yellow('(✔ Gottem)'))
    spinner.error(@pastel.red('(✖ Something went wrong)'))
end

def show_info
    parsed_show
    puts ''
    spinner = TTY::Spinner.new("[:spinner] Grabbing show details", format: :dots, success_mark: '+')
    spinner.auto_spin
    @output = []
    show_info = {
        title: @parsed_page.css('td.section_post_header span').text,
        description: @parsed_page.css('td.show_info_banner_logo p').text,
        poster: @parsed_page.css('td.show_info_main_logo').children.css('img').attribute('src').value,
        imdb_rating: @parsed_page.css('td.show_info_rating_score div')[1].css('b span').text,
    }
    @output << show_info
    spinner.success(@pastel.yellow('(✔)'))
    spinner.error(@pastel.red('(✖)'))
end

def episodes_info
    spinner = TTY::Spinner.new("[:spinner] Pulling magnets", format: :dots, success_mark: '+')
    spinner.auto_spin
    episodes = @parsed_page.css('tr.forum_header_border')
    epcount = episodes.count - 1
    epcount.times do |x|
        ep = {
        episode_name: episodes[x].css('td.forum_thread_post')[1].css('a').text,
        magnet: episodes[x].css('td.forum_thread_post')[2].css('a')[0].attribute('href').value,
        size: episodes[x].css('td.forum_thread_post')[3].text,
        released: episodes[x].css('td.forum_thread_post')[4].text,
        seeds: episodes[x].css('td.forum_thread_post_end').text,
        }
        @output << ep
    end
    spinner.success(@pastel.yellow('(✔)'))
    spinner.error(@pastel.red('(✖)'))
    json_output
end

def json_output
    puts ''
    spinner = TTY::Spinner.new("[:spinner] Writing to /eztv-scraped", format: :dots, success_mark: '+')
    spinner.auto_spin
    magnets = JSON.pretty_generate(@output)
    page_title = @parsed_page.css('td.section_post_header span').text
    Dir.mkdir("./eztv-scraped") unless Dir.exists? ("./eztv-scraped")
    local_fname = './eztv-scraped/' + page_title + '.json'
    local_file = open(local_fname, 'w')
    local_file.write(magnets)
    local_file.close
    spinner.success(@pastel.yellow('(✔)'))
    spinner.error(@pastel.red('(✖)'))
end

def welcome
    titlefont = TTY::Font.new(:starwars)
    subtitlefont = TTY::Font.new(:straight)
    puts @pastel.blue(titlefont.write(" EZTV",))
    puts @pastel.blue(titlefont.write(" Scraper",))
    puts @pastel.blue(titlefont.write("                                      v0.1.0",))
    puts @pastel.red(subtitlefont.write(" Fork it on GitHub",))
    puts @pastel.yellow(" https://github.com/simonpeterdebbarma/eztv-scraper")
    continue_seq
    select_show
end       

def continue_seq
    puts ''
    print " Press any key to continue..."                                                                                                    
    STDIN.getch                                                                                                              
    puts "\n"                                                                                           
end 

welcome