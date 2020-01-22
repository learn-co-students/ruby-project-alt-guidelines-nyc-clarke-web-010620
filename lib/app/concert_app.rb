$prompt = TTY::Prompt.new 

class ConcertApp
    # require 'tty-prompt'

    def run
        # puts "Running!"
        name = welcome
        login_choices(name)
        # signin
    end

    def welcome
        system("clear")
        puts "Welcome to our TicketApp! "
        name = $prompt.ask("What's your name?")
        name
    end 

    def login_choices(name)
        choices = $prompt.select ("Hi #{name}! What would you like to do?") do |menu|
            menu.choice "Sign In", -> {signin}
            menu.choice "Sign up", -> {signup}
        end
    end
    
    def signin
        input = $prompt.ask("What is your username?")
        @user = User.find_by!(username: input) 
        input = $prompt.mask("What is your password?")
        @user = User.find_by!(password: input) 
    end

    def signup
        new_username = $prompt.ask("What would you like your username to be?")
        new_password = $prompt.mask("What would you like your password to be?")
        new_user = User.create(username: new_username, password: new_password) 
    end

    #     if login_choices == "Sign In"
    #         signin
    #     end 
    # end 


    # binding.pry

    # concert_input = prompt.ask("What concert are you looking to attend today?")
    
    # get user into user_var
    # concert_input = prompt.select ('These are the concerts of 2020') do |menu|
    #     Concert.all.each do |concert|
    #         menu.choice concert.artist_name + " at " + concert.venue_name 
    #     end 
    # end 
    
    # new_ticket = Ticket.create
    # new_ticket.user = user_var
    # new_ticket.concert = concert_input
    
    #update or modify 
    #3 > buy ticket , update, cancel 

# def login_or_signup
#     puts "Please provide your name for registration."
#     answer.gets.chomp.downcase
#     @user = User.find_or_create_by(username: answer)
#     sleep(1)
#     puts "Okay, #{@user.username.capitalize}!"
# end 
end