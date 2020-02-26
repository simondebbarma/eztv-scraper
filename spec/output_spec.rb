require_relative '../lib/eztv_scraper/output'

describe 'Output' do
  include Output
  let(:series_link) {'https://eztv.io/shows/885/brooklyn-nine-nine'}
    
  describe '#json_output' do
    it 'Go to a web page and grab the html content ' do
        File.directory?("./eztv-scraped").should be true
    end
  end
end
