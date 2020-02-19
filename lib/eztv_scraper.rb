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

require_relative './eztv_scraper/ui.rb'
require_relative './eztv_scraper/parser.rb'
require_relative './eztv_scraper/shows.rb'
require_relative './eztv_scraper/json.rb'

class EZTVScraper
  include UserInterface
  include Parser
  include Showlist
  include Output

  def initialize
    @pastel = Pastel.new
    welcome
  end
end

EZTVScraper.new
