# data for #fetch_movies_url:
# [
#   "http://www.imdb.com/title/tt0111161/",
#   "http://www.imdb.com/title/tt0068646/",
#   "http://www.imdb.com/title/tt0071562/",
#   "http://www.imdb.com/title/tt0468569/",
#   "http://www.imdb.com/title/tt0050083/"
# ]

# data for #scrape_movie:
# {
#   cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
#   director: "Christopher Nolan",
#   storyline: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
#   title: "The Dark Knight",
#   year: 2008
# }

require_relative "../scraper.rb"

describe "#fetch_movie_urls" do
  it "returns an array of urls of movies" do
    urls = fetch_movie_urls
    expected = [
       "http://www.imdb.com/title/tt0111161/",
       "http://www.imdb.com/title/tt0068646/",
       "http://www.imdb.com/title/tt0071562/",
       "http://www.imdb.com/title/tt0468569/",
       "http://www.imdb.com/title/tt0050083/"
    ]
    expect(urls).to eq(expected)
  end
end

describe "#scrape_movie" do
  it "returns a hash movie" do
    movie = scrape_movie("http://www.imdb.com/title/tt0468569/")

    expected = {
        cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
        director: "Christopher Nolan",
        storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
        title: "The Dark Knight",
        year: 2008
    }
    expect(movie).to eq(expected)
  end
end

