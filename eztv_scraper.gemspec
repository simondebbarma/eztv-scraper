Gem::Specification.new do |s|
    s.name = 'eztv_scraper'
    s.version = '0.1.2'
    s.licenses = ['GPL-3.0']
    s.date = %q{2020-02-20}
    s.summary = 'EZTV-Scraper looks for any selected show on eztv.io and saves magnet links of every single available episode into a JSON file.'
    s.description = <<-DESCRIPTION
    EZTV-Scraper looks for any selected show on eztv.io and saves magnet links of every single available episode into a JSON file.
    
    Usage:
      * Execute `gem install eztv_scraper` to install this gem.
      * Add `gem 'eztv_scraper'` to your Gemfile
      * Rake supports rule patterns to synthesize implicit tasks.
      * Use `require 'eztv_scraper'` inside your ruby file.
      * `EZTVScraper.new` will run this gem."

    This gem does not work standalone. It will be fixed in future versions.
      DESCRIPTION
    s.authors = ['Simon Peter Debbarma']
    s.files = [
      'bin/eztv_scraper',
      'lib/eztv_scraper.rb',
      'lib/EZTVScraper/showlist.rb',
      'lib/EZTVScraper/user_interface.rb',
      'lib/EZTVScraper/output.rb',
      'lib/EZTVScraper/parser.rb',
      'Gemfile',
      'README.md'
    ]
    s.require_paths = ['lib']
  end