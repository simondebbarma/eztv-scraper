# EZTV Scraper

> EZTV-Scraper looks for any selected show on eztv.io and saves magnet links of every single available episode  into a JSON file.

## Quick Start

Install the gem from RubyGems
`gem install eztv_scraper`

Run it anywhere
`eztv_scraper`

---

![Welcome](https://imgur.com/rhkE4jp.png)

The app heavily uses assets from TTY to beautify the interface.

Most of the app doesn't pass any values or parameters to each other. They simply take your selections and downloads the data you want.

![Parsing the page](https://imgur.com/YdQC0Iu.png)

This module parses the websites.

As there are over 6500 shows listed on EZTV, I've filtered the program to parse only the Top 500 show, as ranked by IMDb. You can easily change this in the `./lib/eztv-scraper/ui.rb` file, by changing the loop to the number of shows you want. If you want the app to parse the entire site, you need to change `500` to `all_shows`  and un-comment when we declare `all_shows`

![List of Options](https://imgur.com/MHlgxy1.png)

The app goes through a sequence of methods to grab parse a new page, look for episodes, and downloads them into a file.

![Downloading](https://imgur.com/IMB9mgL.png)

Here's how a JSON file looks like of the scraped page. The first item is a hash of details on the show, and every following item is a hash of every available episode.

![JSON](https://imgur.com/G99jav0.png)



## Built With

- [Ruby](https://www.ruby-lang.org/en/)
- [httparty](https://github.com/jnunemaker/httparty)
- [nokogiri](https://nokogiri.org/)
- [nikkou](https://github.com/tombenner/nikkou)
- [tty](https://ttytoolkit.org)
- [io/console](https://github.com/ruby/io-console)
- [json](https://rubygems.org/gems/json/versions/1.8.3)
- [byebug](https://github.com/deivid-rodriguez/byebug)
- [rspec](https://github.com/rspec/rspec)
- [vcr](https://github.com/vcr/vcr)


## Getting Started


### Prerequisites
You will need **Ruby 2.5** or above.
Visit https://www.ruby-lang.org/en/downloads/ to get your copy.

### Setup
Clone this repo onto your local machine. Make sure you have [git](https://git-scm.com/) installed or use [GiHub Desktop](https://desktop.github.com/).
```
$ git clone https://github.com/simonpeterdebbarma/eztv-scraper.git
```

### Install
This command will install all necessary gems into your system to run this app.
```
$ bundle install
```

### Usage/Deployment
In your terminal, run this command.
```
$ ruby bin/eztv-scraper.rb
```
### Run tests
```
$ gem install rspec
$ rspec
```


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).


## 📝 License

This project is [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html) licensed.

