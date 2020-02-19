module Parser
  def list_parser
    puts
    spinner = TTY::Spinner.new('[:spinner] Parsing EZTV', format: :dots, success_mark: '+')
    spinner.auto_spin
    @eztvurl = 'https://eztv.io/showlist/rating/'
    unparsed_showlist = HTTParty.get(@eztvurl)
    @parsed_showlist = Nokogiri::HTML(unparsed_showlist.body)
    spinner.success(@pastel.blue('(✔)'))
    spinner.error(@pastel.red('(✖)'))
    puts
  end

  def parsed_show
    spinner = TTY::Spinner.new('[:spinner] Looking for episodes', format: :dots, success_mark: '+')
    spinner.auto_spin
    @showurl = @series_link
    unparsed_page = HTTParty.get(@showurl)
    @parsed_page = Nokogiri::HTML(unparsed_page.body)
    spinner.success(@pastel.blue('(✔)'))
    spinner.error(@pastel.red('(✖ Something went wrong)'))
  end
end
