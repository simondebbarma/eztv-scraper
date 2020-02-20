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

require_relative './EZTVScraper/user_interface'
require_relative './EZTVScraper/parser'
require_relative './EZTVScraper/showlist'
require_relative './EZTVScraper/output'

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
