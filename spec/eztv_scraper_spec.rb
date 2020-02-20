require_relative '../lib/eztv_scraper'
require_relative '../lib/eztv_scraper/ui.rb'
require_relative '../lib/eztv_scraper/parser.rb'
require_relative '../lib/eztv_scraper/shows.rb'
require_relative '../lib/eztv_scraper/json.rb'

describe EZTVScraper do
  before(:all) do
    @EZTV = EZTVScraper.new
  end
end
