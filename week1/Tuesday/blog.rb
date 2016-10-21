require 'colorize'
require 'Date'

class Blog
    attr_reader :posts
    attr_accessor :startingpage, :pageSize

    def initialize(posts = [], pageSize = 3, startingpage = 0)
    @posts = posts
    @pageSize = pageSize
    @startingpage = startingpage
    @actualpage = 1
    @pagenumber = []

    end

    def add_post(post)

      @posts.push(post)
      @posts = @posts.sort{|a,b| b.date <=> a.date}
    end

    def moveforward
      @startingpage =  @startingpage + 3
      @actualpage += 1
    end

    def movebackwards
      @startingpage =  @startingpage - 3
      @actualpage += -1
    end

    def pagenumber
    pagenumber = [*1..@posts.length / @pageSize]
    total = ""
    pagenumber.each do |nr|
      if nr == @actualpage
        total+= "#{nr.to_s.colorize(:red)}       "
      else total += "#{nr.to_s}       "
      end
    end
    puts total
    end

    def publish_page
      exit = false
    while exit == false
      @posts.drop(@startingpage).take(@pageSize).each do |post|
        post.publishingformat
      end
      pagenumber
      puts "Use < and > to move pages \nPress 'exit' to close the blog at any time".colorize(:blue)
      nextaction = gets.chomp
      if nextaction == ">"
        moveforward
      elsif nextaction == "<"
        movebackwards
      else
        exit = true
      end
    end

    end
end

class Post
    attr_reader :title, :date, :text
    def initialize(title, date, text)
      @title = title
      @date = date
      @text = text
    end
    def publishingformat
      puts title
      puts "*******************"
      puts text
      puts "-------------------"
    end
end

class FeaturedPost < Post
  def publishingformat
    puts "************#{title}**********"
    puts "*******************"
    puts text
    puts "-------------------"
  end
end



blog = Blog.new
blog.add_post Post.new("6", Date.new(2001,10,5),"text of post 6")
blog.add_post FeaturedPost.new("1", Date.new(2016,6,7),"text of post 1")
blog.add_post Post.new("4", Date.new(2016,6,1), "text of post 4")
blog.add_post Post.new("5", Date.new(2001,10,6),"text of post 5")
blog.add_post FeaturedPost.new("2", Date.new(2016,6,5),"text of post 2")
blog.add_post Post.new("3", Date.new(2016,6,3), "text of post 3")
blog.add_post Post.new("7", Date.new(2000,10,6),"text of post 7")
blog.add_post FeaturedPost.new("8", Date.new(2000,9,5),"text of post 8")
blog.add_post Post.new("9", Date.new(2000,6,3), "text of post 9")


blog.publish_page