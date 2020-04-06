require_relative "scraper"
require "yaml"

puts "Fetching urlsss ...."
urls_movies = fetch_movie_urls

hsh_movies = urls_movies.map do |url|
  scrape_movie(url)
end

p hsh_movies

puts "Writing in YAML..."

File.open("movies.yml", "w") do |file|
  yml_movies = hsh_movies.to_yaml
  file.write(yml_movies)
end

