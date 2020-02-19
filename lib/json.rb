module Output
  def json_output
    puts ''
    spinner = TTY::Spinner.new('[:spinner] Writing to /eztv-scraped', format: :dots, success_mark: '+')
    spinner.auto_spin
    magnets = JSON.pretty_generate(@output)
    page_title = @parsed_page.css('td.section_post_header span').text.gsub(/\W/, '')
    Dir.mkdir('./eztv-scraped') unless Dir.exist? './eztv-scraped'
    local_fname = './eztv-scraped/' + page_title + '.json'
    local_file = File.open(local_fname, 'w')
    local_file.write(magnets)
    local_file.close
    spinner.success(@pastel.blue('(✔)'))
    spinner.error(@pastel.red('(✖)'))
    puts ''
    puts ' All Tasks Completed Successfully!'
    puts ''
    puts ' ---'
    puts ''
  end
end
