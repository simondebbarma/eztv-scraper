require_relative '../lib/eztv_scraper/user_interface'
require_relative '../lib/eztv_scraper/showlist'
require_relative '../lib/eztv_scraper/parser'

require 'io/console'
require 'nokogiri'
require 'tty-prompt'
require 'tty-progressbar'

describe 'UserInterface' do
  include UserInterface
  include Showlist
  include Parser

  describe '#welcome' do
    let(:output) { capture_output { welcome } }
    it 'print welcome ' do
      expect(output).to include(' EZTV')
      expect(output).to include(' Scraper')
      expect(output).to include(' v0.1.6')
      expect(output).to include(' Fork me on GitHub')
      expect(output).to include(' https://github.com/simonpeterdebbarma/eztv-scraper')
    end
  end

  describe '#eztv_scrapper_info' do
    let(:output) { capture_output { eztv_scrapper_info } }
    it 'print intro text ' do
      expect(output).to include(' EZTV Scraper parses https://eztv.io and helps you download')
      expect(output).to include(' the magnets of all available episodes into a JSON file.')
      expect(output).to include(' As there are over 6500+ shows on the website, parsing them can')
      expect(output).to include(' take a lot of time. To save time when using this project,')
      expect(output).to include(' you are limited to only the Top 500 Shows of All Time (IMDb).')
      expect(output).to include(' Check the README for instructions on changing the parameter.')
      expect(output).to include(' It may take about 3 minutes to parse all the data.')
    end
  end

  describe '#show_prompt' do
    it 'Show options to user' do
      expect { show_prompt }.to_not raise_error
    end
  end

  describe '#goodbye' do
    let(:output) { capture_output { goodbye } }
    it 'Goodbye message works' do
      expect(output).to include('      ~ Thank you for using eztv-scraper! ~')
      expect(output).to include(' ~ Star this project on Github if you liked it ~')
    end
  end
end
