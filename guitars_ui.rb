require 'pg'
require 'pry'
require './lib/brand'
require './lib/body'
require './lib/guitar'
require './lib/brand_menu'
require './lib/body_menu'
require './lib/guitar_menu'

DB = PG.connect({:dbname => 'guitars'})

def linespace
  puts "\n"
end

def header
  system 'clear'
  puts "
──────────────────────────────────────────────────────────────────────────────────────────────────────────
─██████████████─██████──██████─██████████─██████████████─██████████████─████████████████───██████████████─
─██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─
─██░░██████████─██░░██──██░░██─████░░████─██████░░██████─██░░██████░░██─██░░████████░░██───██░░██████████─
─██░░██─────────██░░██──██░░██───██░░██───────██░░██─────██░░██──██░░██─██░░██────██░░██───██░░██─────────
─██░░██─────────██░░██──██░░██───██░░██───────██░░██─────██░░██████░░██─██░░████████░░██───██░░██████████─
─██░░██──██████─██░░██──██░░██───██░░██───────██░░██─────██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─
─██░░██──██░░██─██░░██──██░░██───██░░██───────██░░██─────██░░██████░░██─██░░██████░░████───██████████░░██─
─██░░██──██░░██─██░░██──██░░██───██░░██───────██░░██─────██░░██──██░░██─██░░██──██░░██─────────────██░░██─
─██░░██████░░██─██░░██████░░██─████░░████─────██░░██─────██░░██──██░░██─██░░██──██░░██████─██████████░░██─
─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░██─────██░░██─────██░░██──██░░██─██░░██──██░░░░░░██─██░░░░░░░░░░██─
─██████████████─██████████████─██████████─────██████─────██████──██████─██████──██████████─██████████████─
──────────────────────────────────────────────────────────────────────────────────────────────────────────


"
end

def main_menu
  loop do
    linespace
    puts "M > Manufacturer Menu"
    puts "B > Body Type Menu"
    puts "G > Guitar Menu"
    puts "X > Exit."
    linespace
    choice = gets.chomp.upcase
    case(choice)
      when 'M'
        brand_menu
      when 'B'
        body_menu
      when 'G'
        guitar_menu
      when 'X'
        puts "Have an excellent day!"
        exit
      else
        puts "Invalid! Try again"
    end
  end
end

# def brand_menu
#   linespace
#   puts "A > Add a manufacturer"
#   puts "L > List manufacturers"
#   puts "D > Delete a manufacturer"
#   puts "R > Return to main menu."
#   linespace
#   choice = gets.chomp.upcase
#   case(choice)
#     when 'A'
#       linespace
#       puts "Manufacturer name:"
#       brand = gets.chomp
#       new_brand = Brand.new({:brand => brand})
#       new_brand.save
#       puts "#{new_brand.brand} has been added!"
#       brand_menu
#     when 'L'
#       linespace
#       results = Brand.all
#       puts "All Manufacturers:"
#       results.each do |result|
#         puts "Brand: #{result.brand}"
#         linespace
#       end
#       brand_menu
#     when 'D'
#       linespace
#       puts "Manufacturer to remove:"
#       brand_to_remove = gets.chomp
#       results = Brand.all
#       results.each do |result|
#         if result.brand == brand_to_remove
#           puts "Brand #{result.brand} has been removed."
#           result.delete
#         else
#           puts "Result not found.  Did you type the name correctly?"
#         end
#       end
#       brand_menu
#     when 'R'
#       main_menu
#     else
#       puts "Invalid! Try again"
#   end
# end

header
main_menu
