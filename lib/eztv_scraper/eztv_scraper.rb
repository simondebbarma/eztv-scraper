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

require_relative '../ui.rb'
require_relative '../parser.rb'
require_relative '../shows.rb'
require_relative '../json.rb'

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
