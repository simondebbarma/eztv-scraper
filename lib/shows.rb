module Showlist

  def showlist
    list_parser
    @shows = []
    complete = @pastel.on_green(' ')
    incomplete = @pastel.on_red(' ')
    bar = TTY::ProgressBar.new('Grabbing your favorite shows [:bar]', total: 500, width: 50, complete: complete, incomplete: incomplete)
    500.times do |n|
      @shows << @parsed_showlist.css('td.forum_thread_post')[n * 3].text
      bar.advance(1)
    end
    puts ''
    show_prompt
  end

  def show_info
    parsed_show
    puts ''
    spinner = TTY::Spinner.new('[:spinner] Grabbing show details', format: :dots, success_mark: '+')
    spinner.auto_spin
    @output = []
    show_info = {
      title: @parsed_page.css('td.section_post_header span')&.text,
      description: @parsed_page.css('td.show_info_banner_logo p')&.text,
      poster: '' + @parsed_page.css('td.show_info_main_logo').children.css('img')&.attribute('src')&.value,
      imdb_rating: @parsed_page.css('td.show_info_rating_score div')[1].css('b span')&.text
    }
    @output << show_info
    spinner.success(@pastel.blue('(✔)'))
    spinner.error(@pastel.red('(✖)'))
  end

  def episodes_info
    spinner = TTY::Spinner.new('[:spinner] Pulling magnets', format: :dots, success_mark: '+')
    spinner.auto_spin
    episodes = @parsed_page.css('tr.forum_header_border')
    episodes.size.times do |n|
      thread_posts = episodes[n].css('td.forum_thread_post')
      ep = {
        episode_name: thread_posts[1].css('a')&.text,
        magnet: thread_posts[2].css('a').first&.attribute('href')&.value.to_s,
        size: thread_posts[3]&.text,
        released: thread_posts[4]&.text,
        seeds: episodes[n].css('td.forum_thread_post_end')&.text
      }
      @output << ep
    end
    spinner.success(@pastel.blue('(✔)'))
    spinner.error(@pastel.red('(✖)'))
    json_output
    choice_search
  end
end
