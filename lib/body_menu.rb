def body_menu
  linespace
  puts "A > Add a body style"
  puts "L > List body styles"
  puts "D > Delete a body style"
  puts "R > Return to main menu."
  linespace
  choice = gets.chomp.upcase
  case(choice)
    when 'A'
      linespace
      puts "Body Style name:"
      body = gets.chomp
      new_body = Body.new({:body => body})
      new_body.save
      puts "#{new_body.body} has been added!"
      body_menu
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
