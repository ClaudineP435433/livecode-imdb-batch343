
require_relative '../scraper'

describe "#scrap_movies_from_imdb" do
  it 'returns an array of movies url' do
    actual = scrap_movies_from_imdb
    expected =  [
      "http://www.imdb.com/title/tt0111161/",
      "http://www.imdb.com/title/tt0068646/",
      "http://www.imdb.com/title/tt0071562/",
      "http://www.imdb.com/title/tt0468569/",
      "http://www.imdb.com/title/tt0050083/"
    ]
    expect(actual).to eq(expected)
  end
end

describe "#scrap_movie_details" do
  it "returns a movie as a hash" do
    actual = scrap_movie_details("http://www.imdb.com/title/tt0468569/")
    expected = {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008
    }
    expect(actual).to eq(expected)
  end
end















