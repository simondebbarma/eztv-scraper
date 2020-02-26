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

require_relative './eztv_scraper/user_interface'
require_relative './eztv_scraper/parser'
require_relative './eztv_scraper/showlist'
require_relative './eztv_scraper/output'

class EZTVScraper
  include UserInterface
  include Parser
  include Showlist
  include Output

  def initialize
    @pastel = Pastel.new
    welcome
    eztv_scrapper_info
    scraper
  end

  def scraper
    list_parser
    show_prompt
    search_link
    series_link = @series_link
    parsed_show(series_link)
    episodes_info(series_link)
    json_output
  end
end
