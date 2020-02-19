module UserInterface
  def welcome
    titlefont = TTY::Font.new(:starwars)
    subtitlefont = TTY::Font.new(:straight)
    puts @pastel.blue(titlefont.write(' EZTV'))
    puts @pastel.blue(titlefont.write(' Scraper'))
    puts @pastel.blue(titlefont.write('                                      v0.1.0'))
    sleep(2)
    puts @pastel.red(subtitlefont.write(' Fork me on GitHub'))
    puts @pastel.yellow(' https://github.com/simonpeterdebbarma/eztv-scraper')
    eztv_scrapper_info
    continue_seq
    showlist
  end

  def show_prompt
    @prompt = TTY::Prompt.new
    show = @prompt.select(@pastel.magenta('Select a TV show?' + @pastel.red(' (Filter only accepts 1 word)')), @shows, filter: true, per_page: 20, keys: [:return])
    @series_link = 'https://eztv.io' + @parsed_showlist.search('a').text_includes(show).attribute('href').value
    puts ''
    puts ' Fantastic Choice!'
    puts ''
    show_info
    puts ''
    episodes_info
  end

  def eztv_scrapper_info
    puts ''
    puts ' EZTV Scraper parses https://eztv.io and helps you download'
    puts ' the magnets of all available episodes into a JSON file.'
    puts ''
    puts ' As there are over 6500+ shows on the website, parsing them can'
    puts ' take a lot of time. To save time spent reviewing this project,'
    puts ' you are limited to only the Top 500 Shows of All Time (IMDb).'
    puts ''
    puts @pastel.red(' It may take about 3 minutes to parse all the data.')
    puts ''
    puts ' How about a bit of exurb1a in the meantime?'
    puts @pastel.blue(' https://www.youtube.com/watch?v=V_Ac-SVYI48')
  end

  def choice_search
    choice = @prompt.yes?(' Would you like download another series?')
    if choice == true
      puts ''
      show_prompt
    elsif choice == false
      goodbye
    end
  end

  def goodbye
    puts ''
    puts @pastel.green('      ~ Thank you for using eztv-scraper! ~')
    puts @pastel.green(' ~ Star this project on Github if you liked it ~')
  end

  def continue_seq
    puts ''
    print ' Press any key to continue...'
    STDIN.getch
    puts "\n"
  end
end
