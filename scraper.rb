require 'open-uri'
require 'nokogiri'

def scrap_movies_from_imdb
  url = "https://www.imdb.com/chart/top"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  urls_movie = []
  html_doc.search('.lister-list .titleColumn a').first(5).each do |element|
    urls_movie << "http://www.imdb.com#{element.attribute('href').value}"
  end
  return urls_movie
end

def scrap_movie_details(url)
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  storyline = html_doc.search('.summary_text').text.strip
  title_and_date = html_doc.search('.title_wrapper h1').text.strip
  title = title_and_date.split(':')[0]
  date = title_and_date.split('(')[1].chop.to_i

  cast = html_doc.search('.cast_list .primary_photo + td a').first(3).map do |element|
    # + td permet d acceder à la balise td en dessous de la classe primary_photo
    element.text.strip
  end

  director = html_doc.search('.credit_summary_item a').first.text.strip

  director_bis = html_doc.search(".credit_summary_item h4:contains('Director') + a").text.strip

  movie = {
    cast: cast,
    director: director,
    storyline: storyline,
    title: title,
    year: date
  }
end

