require "yaml"
# array = [ { a: "a" }, { b: "b" }]
# puts array.to_yaml

# File.open("the_file.yml", "w") do |f|
#   f.write("something")
# end

# scrapper l'url 'https://www.imdb.com/chart/top' => Nom du film + url du film
# iteration - scrapper l'url de chaque film


# movies = [ {movie}, {movie}]

require_relative 'scraper'

urls = scrap_movies_from_imdb

movies = urls.map do |url|
  scrap_movie_details(url)
end

p movies

File.open("the_file.yml", "w") do |f|
  f.write(movies.to_yaml)
end
