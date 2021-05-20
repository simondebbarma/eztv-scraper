Gem::Specification.new do |s|
    s.name = 'eztv_scraper'
    s.version = '0.1.6'
    s.licenses = ['GPL-3.0']
    s.date = %q{2020-02-20}
    s.summary = 'eztv_scraper looks for any selected show on eztv.io and saves magnet links of every single available episode into a JSON file.'
    s.executables << 'eztv_scraper'
    s.authors = ['Simon Peter Debbarma']
    s.files = [
      'bin/eztv_scraper',
      'lib/eztv_scraper.rb',
      'lib/eztv_scraper/showlist.rb',
      'lib/eztv_scraper/user_interface.rb',
      'lib/eztv_scraper/output.rb',
      'lib/eztv_scraper/parser.rb',
      'Gemfile',
      'README.md'
    ]
    s.require_paths = ['lib']

    s.add_dependency 'httparty', '~> 0.17.3'
    s.add_dependency 'json', '~> 2.3.0'
    s.add_dependency 'nikkou', '~> 0.0.5'
    s.add_dependency 'nokogiri', '>= 1.10.8', '< 1.12.0'
    s.add_dependency 'pastel', '~> 0.7.3'
    s.add_dependency 'tty-font', '~> 0.5.0'
    s.add_dependency 'tty-progressbar', '~> 0.17.0'
    s.add_dependency 'tty-prompt', '~> 0.20.0'
    s.add_dependency 'tty-spinner', '~> 0.9.3'

    s.add_development_dependency 'rspec', '~> 3.9.0'
    s.add_development_dependency 'byebug', '~> 11.1.1'
  end