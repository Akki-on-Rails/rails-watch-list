# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'net/http'
require 'uri'

puts "Cleaning DB"
Movie.destroy_all

uri = URI('https://tmdb.lewagon.com/movie/top_rated')
response = Net::HTTP.get(uri)
movie_list = JSON.parse(response)

puts "Creating Movies..."
index = 0
10.times do
  Movie.create!(
    title: movie_list["results"][index]["title"],
    overview: movie_list["results"][index]["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie_list["results"][index]["poster_path"]}",
    rating: movie_list["results"][index]["vote_average"]
  )
  puts "Movie #{index}..."
  index += 1
end

puts "Done"
