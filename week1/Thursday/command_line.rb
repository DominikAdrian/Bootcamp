require_relative "password_validator"

class Printer
  def print(text)
    puts text
  end
end

class Reader
  def read
    gets.chomp
  end

  def read_number
    read.to_i
  end
end

class TextApp
  attr_reader :printer, :reader
  def initialize(printer, reader)
    @printer = printer
    @reader = reader
  end

  def run
    username = get_username
    password = get_password

    if ! PasswordValidator.new(username, password).valid?
      printer.print "Wrong credentials"
      exit
    end

    printer.print "Enter some text:"
    text = reader.read
    while true do
      print_options
      option = reader.read_number
      run_command(option, text)
    end
  end

  def get_username
    printer.print "Username:"
    reader.read
  end

  def get_password
    printer.print "Password:"
    reader.read
  end

  OPTIONS = [
    { number: 1, description: "Count words", method: :count_words },
    { number: 2, description: "Count letters", method: "count_letters" },
    { number: 3, description: "Reverse", method: :reverse },
    { number: 4, description: "Upcase", method: :upcase },
    { number: 5, description: "Downcase", method: :downcase },
  ]

  def print_options
    OPTIONS.each do |option|
      printer.print "#{option[:number]}. #{option[:description]}"
    end
  end

  def run_command(number, text)
    option = OPTIONS.find { |opt| opt[:number] == number }
    printer.print "#{option[:description]}: #{send(option[:method], text)}"
  end

  def count_words(text)
    text.split.size
  end

  def count_letters(text)
    text.split(/\W+/).join.size
  end

  # ...

end


TextApp.new(Printer.new, Reader.new).run