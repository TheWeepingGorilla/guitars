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
      new_body_id = 0
      new_brand_id = 0
      new_brand_id = get_brand
      guitar_menu if new_brand_id == 0
      new_body_id = get_body
      guitar_menu if new_body_id == 0
      new_guitar = Guitar.new({:brand_id => new_brand_id, :body_id => new_body_id})
      new_guitar.save
      linespace
      puts "New guitar model saved!"
      guitar_menu
    when 'L'
      linespace
      results = Guitar.all
      puts "All guitar models:"
      linespace
      results.each do |result|
        brand_display = DB.exec("SELECT brand FROM brands WHERE id = #{result.brand_id};").first["brand"]
        body_display = DB.exec("SELECT body FROM bodies WHERE id = #{result.body_id};").first["body"]
        puts "#{result.id} #{brand_display} #{body_display}"
      end
      guitar_menu
    when 'D'
      linespace
      puts "Id of guitar model to remove:"
      id_to_remove = gets.chomp.to_i
      results = Guitar.all
      not_found = true
      results.each do |result|
        if result.id == id_to_remove
          linespace
          puts "Guitar #{result.id} has been removed."
          result.delete
          not_found = false
        end
      end
      if (not_found)
        linespace
        puts "** Model not found!  (L will list all guitar models)."
      end
      guitar_menu
    when 'R'
      main_menu
    else
      puts "Invalid! Try again"
  end
end

def get_body
  linespace
  results = Body.all
  puts "All Body Types:"
  results.each do |result|
    puts "#{result.id} : #{result.body}"
  end
  linespace
  puts "Enter id of body type:"
  body_type_id = gets.chomp.to_i
  results.each do |result|
    if result.id == body_type_id
      linespace
      puts "New guitar model will have a #{result.body} body type."
      return result.id
    end
  end
  linespace
  puts "** Not a valid body id."
  return 0
end

def get_brand
  linespace
  results = Brand.all
  puts "All Manufacturers:"
  results.each do |result|
    puts "#{result.id} : #{result.brand}"
  end
  linespace
  puts "Enter id of manufacturer:"
  brand_id = gets.chomp.to_i
  results.each do |result|
    if result.id == brand_id
      linespace
      puts "New guitar model is made by #{result.brand}."
      return result.id
    end
  end
  linespace
  puts "** Not a valid manufacturer id."
  return 0
end
