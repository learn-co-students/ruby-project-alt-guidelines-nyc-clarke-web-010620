require_relative '../config/environment'
require 'tty-prompt'

app = ConcertApp.new
app.run

# require_relative'../lib/concert.rb'
    
# def welcome
#     # system("clear")
#     prompt = TTY::Prompt.new     
#     puts "Welcome to our TicketApp! "
# end

# def get_name 
#     prompt = TTY::Prompt.new
#     name = prompt.ask("What's your name?")
#     name 
# end 

# def display_concerts
#     prompt = TTY::Prompt.new
#     concert_input = prompt.select ('These are the concerts of 2020') do |menu|
#         Concert.all.each do |concert|
#             menu.choice concert.artist_name + " at " + concert.venue_name 
#         end 
#     end 
#     # selection = 
# end 

# def runner 
#     system('clear')
#     welcome 
#     get_name
#     display_concerts
# end 

# runner
