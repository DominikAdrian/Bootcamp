require "pry"
require "ruby-dictionary"


class WordChain
    def initialize(dictionary)
        @dictionary = dictionary
        @exist_words = []
        @counter = 0
    end

    def find_chain(word1, word2)
        if check_word(word1) && check_word(word2)
        	while word1 != word2
        		if word1.class == Array
        			word1 = word1.join('')
        		end
        		word1 = search_word(word1, word2)	
                puts word1
        	end
            
        else 
        	puts "Correct inputed words"
        end
    end

 

    def search_word(word1, word2)

      arr_word1 = word1.split("")
      arr_word2 = word2.split("")

      changed_arr = arr_word1.each_with_index.map do |letter, index|
                if @counter == index
                    if arr_word1[index] == arr_word2[index]
                       arr_word1[index]
                    else
                        arr_word2[index]
                    end
                 else
                    letter   
                end
            end

        if @counter != arr_word1.length - 1
            @counter +=1
        else
            @counter = 0
        end

        if check_word(changed_arr.join)
            @exist_words << changed_arr.join
            changed_arr.join
        else
            arr_word1.join
        end

    	# arr_word1.each_with_index do |letter, i|
    	# 	aux = arr_word1

    	# 	if arr_word1[i] != arr_word2[i]
    	# 		arr_word1.replace(i)join
    	# 	else
    	# 		puts "This word doesnt exist #{aux.join}"
    	# 		aux[i] = arr_word1[i]
    	# 	end

     #        puts word1
    	# end
    end
    

    def check_word(word)

    @dictionary.exists?(word)
    end
end




# require_relative './WordChain.rb'


dictionary = Dictionary.from_file("/Users/User/Documents/words.txt")
my_chain = WordChain.new(dictionary)
my_chain.find_chain("cat", "dog")

