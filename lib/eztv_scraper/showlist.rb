module Showlist
  def showlist
    shows = []
    bar = TTY::ProgressBar.new('Grabbing your favorite shows [:bar]', total: 5, width: 50)
    5.times do |n|
      shows << list_parser.css('td.forum_thread_post')[n * 3].text
      bar.advance(1)
    end
    shows
  end

  def search_link
    @series_link = 'https://eztv.io' + list_parser.search('a').text_includes(@show).attribute('href').value
  end

  def show_info(series_link)
    @output = []
    # series_link = @series_link
    show_info = {
      title: parsed_show(series_link).css('td.section_post_header span')&.text,
      description: parsed_show(series_link).css('td.show_info_banner_logo p')&.text,
      poster: parsed_show(series_link).css('td.show_info_main_logo').children.css('img')&.attribute('src')&.value,
      imdb_rating: parsed_show(series_link).css('td.show_info_rating_score div')[1].css('b span')&.text
    }
    @output << show_info
    @output
  end

  def episodes_info(series_link)
    show_info(series_link)
    # series_link = @series_link
    episodes = parsed_show(series_link).css('tr.forum_header_border')
    episodes.size.times do |n|
      thread_posts = episodes[n].css('td.forum_thread_post')
      episode = {
        episode_name: thread_posts[1].css('a')&.text,
        magnet: thread_posts[2].css('a').first&.attribute('href')&.value.to_s,
        size: thread_posts[3]&.text,
        released: thread_posts[4]&.text,
        seeds: episodes[n].css('td.forum_thread_post_end')&.text
      }
      @output << episode
    end
    @output
  end
end
