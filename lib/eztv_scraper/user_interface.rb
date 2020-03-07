module UserInterface
  def welcome
    puts ' EZTV'
    puts ' Scraper'
    puts ' v0.1.6'
    puts ' Fork me on GitHub'
    puts ' https://github.com/simonpeterdebbarma/eztv-scraper'
  end

  def eztv_scrapper_info
    puts ' EZTV Scraper parses https://eztv.io and helps you download'
    puts ' the magnets of all available episodes into a JSON file.'
    puts ' As there are over 6500+ shows on the website, parsing them can'
    puts ' take a lot of time. To save time when using this project,'
    puts ' you are limited to only the Top 500 Shows of All Time (IMDb).'
    puts ' Check the README for instructions on changing the parameter.'
    puts ' It may take about 3 minutes to parse all the data.'
  end

  def show_prompt
    @prompt = TTY::Prompt.new
    @show = @prompt.select('Select a TV show? (Filter only accepts 1 word)', showlist, filter: true, per_page: 20, keys: [:return])
  end

  def goodbye
    puts '      ~ Thank you for using eztv-scraper! ~'
    puts ' ~ Star this project on Github if you liked it ~'
  end
end
