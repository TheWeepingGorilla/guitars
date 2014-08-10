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
        puts "#{result.body}"
      end
      body_menu
    when 'D'
      linespace
      puts "Body Type to remove:"
      body_to_remove = gets.chomp
      results = Body.all
      not_found = true
      results.each do |result|
        if result.body == body_to_remove
          linespace
          puts "Body #{result.body} has been removed."
          result.delete
          not_found = false
        end
      end
      if (not_found)
        linespace
        puts "** Body Type not found! (L will list all body types)."
      end
      body_menu
    when 'R'
      main_menu
    else
      puts "Invalid! Try again"
  end
end
