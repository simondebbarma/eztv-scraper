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

require_relative '../lib/ui.rb'
require_relative '../lib/parser.rb'
require_relative '../lib/shows.rb'
require_relative '../lib/json.rb'

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
