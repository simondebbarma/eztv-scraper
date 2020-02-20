require_relative 'bin/eztv-scraper'

RSpec.describe EZTVScraper do
  before(:all) do
    @eztv = EZTVScraper.new
  end

  describe 'showlist' do
    it 'create an array called shows' do
      expect(@shows).to be_an Array
    end
  end
end
