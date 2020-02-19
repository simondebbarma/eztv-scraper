require_relative '../lib/eztv_scraper'
require_relative '../lib/eztv_scraper/ui.rb'
require_relative '../lib/eztv_scraper/parser.rb'
require_relative '../lib/eztv_scraper/shows.rb'
require_relative '../lib/eztv_scraper/json.rb'

include UserInterface
include Parser
include Showlist
include Output

describe EZTVScraper do
    describe 'list_parser' do
        it 'parses a page' do
            @pastel = Pastel.new
            expect(welcome).to eq(true)
        end

        it 'pe' do
            expect(welcome).to eq(false)
        end
    end
end
