require_relative '../lib/eztv_scraper/showlist'
require_relative '../lib/eztv_scraper/parser'
require 'tty-progressbar'
require 'nokogiri'
require 'httparty'

describe 'Showlist' do
  include Showlist
  include Parser

  describe '#showlist' do
    it 'Grab list of shows from EZTV' do
      expect(showlist.count).to eq(5)
    end
  end

  describe '#show_info' do
    let(:series_link) { 'https://eztv.io/shows/885/brooklyn-nine-nine' }

    it 'grabs info about show and create an object hash' do
      expect(show_info(series_link).count).to be >= 1
    end
  end

  describe '#episodes_info' do
    let(:series_link) { 'https://eztv.io/shows/885/brooklyn-nine-nine' }

    it 'grabs episodes and push details into output' do
      expect(episodes_info(series_link).count).to be >= 1
    end
  end
end
