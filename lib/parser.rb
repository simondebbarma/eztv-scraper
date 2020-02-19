module Parser
  def list_parser
    puts ''
    spinner = TTY::Spinner.new('[:spinner] Parsing EZTV', format: :dots, success_mark: '+')
    spinner.auto_spin
    eztv = 'https://eztv.io/showlist/rating/'
    unparsed_showlist = HTTParty.get(eztv)
    @parsed_showlist = Nokogiri::HTML(unparsed_showlist.body)
    spinner.success(@pastel.blue('(✔)'))
    spinner.error(@pastel.red('(✖)'))
    puts ''
  end

  def parsed_show
    spinner = TTY::Spinner.new('[:spinner] Searching the database!', format: :dots, success_mark: '+')
    spinner.auto_spin
    url = @series_link
    unparsed_page = HTTParty.get(url)
    @parsed_page = Nokogiri::HTML(unparsed_page.body)
    spinner.success(@pastel.blue('(✔)'))
    spinner.error(@pastel.red('(✖ Something went wrong)'))
  end
end
