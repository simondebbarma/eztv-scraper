require_relative '../lib/eztv_scraper/parser'

describe 'Parser' do
  include Parser
  let(:series_link) { 'https://eztv.io/shows/885/brooklyn-nine-nine' }

  describe '#list_parser' do
    it 'parse EZTV main site ' do
      expect { list_parser }.to_not raise_error
    end
  end

  describe '#parsed_show' do
    it 'Go to show page and grab episodes ' do
      expect { parsed_show(series_link) }.to_not raise_error
    end
  end
end
