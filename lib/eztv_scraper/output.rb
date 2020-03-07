module Output
  def json_output
    series_link = @series_link
    magnets = JSON.pretty_generate(@output)
    page_title = parsed_show(series_link).css('td.section_post_header span').text.gsub(/\W/, '')
    Dir.mkdir('./eztv-scraped') unless Dir.exist? './eztv-scraped'
    local_fname = './eztv-scraped/' + page_title + '.json'
    local_file = File.open(local_fname, 'w')
    local_file.write(magnets)
    local_file.close
    puts ' Printed to directory ./eztv_scraped'
    puts ' ---'
  end
end
