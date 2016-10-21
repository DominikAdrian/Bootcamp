require "imdb"
require "colorize"

#i = Imdb::Search.new("Star Trek")
#p i.movies[0].rating

class SearchEngine	
	def initialize(file)
		@file = file
		@imdb_array = []
		@rating_array = []
		@movies
	end

	def search_movie
		@movies = IO.read(@file).split("\n")
		@movies.each do |title|
			@imdb_array.push(Imdb::Search.new(title))
		end
		search_rating
		show_output
	end

	def search_rating
		@imdb_array.each do |search_query|
			@rating_array.push(search_query.movies[0].rating)
		end
	end

	def show_output
		counter = 8
		for rating in 1..counter
			@rating_array.each do |rating|
				if rating >= counter
					print '|#'
				else
					print '| '
				end
			end
			print "|\n"
			counter -= 1
		end
		puts "_______________"

		@rating_array.length.times do |i|
			print '|' 
			print (i+1).to_s.colorize(:light_blue)
		end
		puts "|\n\n"

		counter = 1
		@movies.each do |title|
			puts "#{counter.to_s.colorize(:light_blue)}: #{title}"
			counter += 1
		end


	end
end



movies = "Ghostbusters\n Die Hard\n The Godfather\n Home alone\n Star trek, the new generation\n The night of the living dead\n Titanic"
IO.write("movies.txt", movies)

search = SearchEngine.new("movies.txt")
search.search_movie