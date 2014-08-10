def brand_menu
  linespace
  puts "A > Add a manufacturer"
  puts "L > List manufacturers"
  puts "D > Delete a manufacturer"
  puts "R > Return to main menu."
  linespace
  choice = gets.chomp.upcase
  case(choice)
    when 'A'
      linespace
      puts "Manufacturer name:"
      brand = gets.chomp
      new_brand = Brand.new({:brand => brand})
      new_brand.save
      puts "#{new_brand.brand} has been added!"
      brand_menu
    when 'L'
      linespace
      results = Brand.all
      puts "All Manufacturers:"
      linespace
      results.each do |result|
        puts "#{result.brand}"
      end
      brand_menu
    when 'D'
      linespace
      puts "Manufacturer to remove:"
      brand_to_remove = gets.chomp
      results = Brand.all
      not_found = true
      results.each do |result|
        if result.brand == brand_to_remove
          linespace
          puts "Manufacturer #{result.brand} has been removed."
          result.delete
          not_found = false
        end
      end
      if (not_found)
        linespace
        puts "** Manufacturer not found! (L will list all manufacturers)."
      end
      brand_menu
    when 'R'
      main_menu
    else
      puts "Invalid! Try again"
  end
end
