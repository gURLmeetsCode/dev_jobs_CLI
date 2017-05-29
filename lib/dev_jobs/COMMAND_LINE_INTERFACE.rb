# CLI controller

class FindFitnessClass::CLI
  def call
    start
  end

  def list
    puts ""
    puts "************* Latest Group Fitness Classes *************"
    puts ""
    FindFitnessClass::Session.all.each.with_index(1) do |session, i|
      puts "#{i}. #{session.name}"
    end
    puts ""
  end

  def print_session(session)
    puts ""
    puts "-------------- #{session.name} --------------"

    puts ""
    puts movie.description
    puts ""

    puts "Price: #{session.price}"
    puts ""

    puts "Time Left on Deal: #{session.counter}"
    puts ""
  end

  def start
    list
    input = nil
    while input != "exit"
      puts ""
      puts "What fitness class would you more information on, by name or number?"
      puts ""
      puts "Enter list to see the available classes again."
      puts "Enter exit to end the program."
      puts ""
      input = gets.strip
      if input == "list"
        list
      elsif input.to_i == 0
        if movie = FindFitnessClass::Session.find_by_name(input)
          print_session(session)
        end
      elsif input.to_i > 0
        if movie = FindFitnessClass::Session.find(input.to_i)
          print_session(session)
        end
      end
    end
    puts "Enjoy your workout!"
  end
end
