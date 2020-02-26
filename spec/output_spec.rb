require_relative '../lib/eztv_scraper/output'

describe 'Output' do
  include Output
  let(:series_link) { 'https://eztv.io/shows/885/brooklyn-nine-nine' }

  describe '#json_output' do
    it 'Create a folder and save file -  This will show false if app not run even once' do
      File.directory?('./eztv-scraped').should be true
    end
  end
end
