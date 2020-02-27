require_relative '../lib/eztv_scraper'
require_relative '../lib/eztv_scraper/user_interface'
require_relative '../lib/eztv_scraper/parser'
require_relative '../lib/eztv_scraper/showlist'
require_relative '../lib/eztv_scraper/output'

describe EZTVScraper do
  before(:all) do
    @eztv = EZTVScraper.new
  end

  describe 'showlist' do
    it 'create an array called shows' do
      expect(@shows).to be_an Array
    end
  end
end
