require "open-uri"
require "nokogiri"

def fetch_movie_urls
  url = open("https://www.imdb.com/chart/top").read
  document = Nokogiri::HTML(url)
  movies = document.search('.titleColumn a').take(5)
  movies.map do |movie|
    "http://www.imdb.com#{movie.attributes["href"].value}"
  end
end


def scrape_movie(url)
  url = open(url).read
  document = Nokogiri::HTML(url)
  items = document.search('.credit_summary_item a')

  director_name = items[0].text
  # cast = document.search('.primary_photo + td a').take(3).map { |e| e.text.strip }
  cast = [items[4].text, items[5].text, items[6].text]
  storyline = document.search('.summary_text').text.strip
  title_match = document.search('.title_wrapper h1').text.strip.match(/(?<title>.*)\((?<year>\d{4})\)/)
  title = title_match[:title][0..-2]
  year = title_match[:year].to_i

  {cast: cast, director: director_name, storyline: storyline, title: title, year: year}
end


# p scrape_movie("http://www.imdb.com/title/tt0468569/")
