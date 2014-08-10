def guitar_menu
  linespace
  puts "A > Add a guitar model"
  puts "L > List guitar models"
  puts "D > Delete a guitar model"
  puts "R > Return to main menu."
  linespace
  choice = gets.chomp.upcase
  case(choice)
    when 'A'
      linespace
      get_body_type

      guitar_menu
    when 'L'
      linespace
      results = Body.all
      puts "All Body Types:"
      linespace
      results.each do |result|
        puts "Body: #{result.body}"
        linespace
      end
      body_menu
    when 'D'
      linespace
      puts "Body Type to remove:"
      body_to_remove = gets.chomp
      results = Body.all
      results.each do |result|
        if result.body == body_to_remove
          puts "Body #{result.body} has been removed."
          result.delete
        else
          puts "Result not found.  Did you type the name correctly?"
        end
      end
      body_menu
    when 'R'
      main_menu
    else
      puts "Invalid! Try again"
  end
end

def get_body_type
  linespace
  puts "Body Type of model:"
  body_type = gets.chomp
  results = Body.all
  p results

  results.each do |result|
    if result.body == body_type
      puts "New Guitar model will have #{result.body}."
      break
    else
      puts "Result not found.  Did you type the name correctly?"
      break
    end
  end
end
