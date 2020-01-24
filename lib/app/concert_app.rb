$prompt = TTY::Prompt.new 

class ConcertApp


    def run
        name = welcome
        login_choices(name)
        buy_edit_cancel  
    end


    def welcome
        system("clear")
        puts " /$$$$$$$$ /$$           /$$                   /$$            /$$$$$$        ".green             
        puts "|__  $$__/|__/          | $$                  | $$           /$$__  $$       ".green              
        puts "   | $$    /$$  /$$$$$$$| $$   /$$  /$$$$$$  /$$$$$$        | $$  \\ $$  /$$$$$$   /$$$$$$ ".green
        puts "   | $$   | $$ /$$_____/| $$  /$$/ /$$__  $$|_  $$_/        | $$$$$$$$ /$$__  $$ /$$__  $$ ".green
        puts "   | $$   | $$| $$      | $$$$$$/ | $$$$$$$$  | $$          | $$__  $$| $$  \\ $$| $$  \\ $$ ".green
        puts "   | $$   | $$| $$      | $$_  $$ | $$_____/  | $$ /$$      | $$  | $$| $$  | $$| $$  | $$ ".green
        puts "   | $$   | $$|  $$$$$$$| $$ \\  $$|  $$$$$$$  |  $$$$/      | $$  | $$| $$$$$$$/| $$$$$$$/ ".green
        puts "   |__/   |__/ \\_______/|__/  \\__/ \\_______/   \\___/        |__/  |__/| $$____/ | $$____/  ".green
        puts "                                                                      | $$      | $$       ".green
        puts "                                                                      | $$      | $$       ".green
        puts "                                                                      |__/      |__/       ".green
                                                                                               
       
        puts "Welcome to our Ticket App!".bold 
        name = $prompt.ask("What is your name?".red)
        name
    end 


    def find_user(string)
        User.all.find_by(name: string)
    end 


    def login_choices(name)
        choices = $prompt.select ("Hi #{name.capitalize}! What would you like to do?".red) do |menu|
            menu.choice "Sign In", -> {signin}
            menu.choice "Sign Up", -> {signup}
        end
    end
    

    def signin
        username_input = $prompt.ask("What is your username?".red)
        @user = User.find_by!(username: username_input) 
        password_input = $prompt.mask("Welcome back! What is your password?")
        # @user = User.find_by!(password: password_input) 
        if password_input != @user.password
            puts "Incorrect Password!".red
            signin
        else
        @user = User.find_by!(password: password_input) 
        end
    end


    def signup
        new_username = $prompt.ask("What would you like your username to be?".red)
        new_password = $prompt.mask("What would you like your password to be?".red)
        @user = User.create(username: new_username, password: new_password)     
    end


    def buy_edit_cancel
        option = $prompt.select("What would you like to do?".red) do |menu|
            menu.choice "Buy Ticket", -> {list_concerts}
            menu.choice "Refund Tickets", -> {refund_tickets}
            menu.choice "Update Password", -> {update_password}
            menu.choice "Sign Out"
        end
        option
    end 



    def list_concerts
        concert_input = $prompt.select ("These are the concerts of 2020:".bold) do |menu|
            Concert.all.each do |concert|
                menu.choice concert.artist_name + " at " + concert.venue_name, -> do 
                    if !check_if_purchased(concert.artist_name)
                        new_ticket = Ticket.create(user_id: @user.id,concert_id: concert.id)
                        puts "Ticket was successfully purchesed!"
                        buy_edit_cancel 
                    end
                end  
            end 
        end 
    end 

    def check_if_purchased(artist)
        @user.tickets.each do |ticket|
            if ticket.concert.artist_name == artist
                puts "Ticket exists. Please reselect your ticket."
                return true
            end 
        end 
        false
    end 

    def refund_tickets
        current_ticket = $prompt.select ("These are all your purchased tickets! Which one would you like to refund?".red) do |menu|
            @user.tickets.each do |ticket|
                menu.choice ticket.concert.artist_name, -> do 
                    ticket.destroy
                    @user = User.find(@user.id)
                    puts "Refund Complete! Go back to the main menu to purchase a new ticket!".red 
                    buy_edit_cancel
                end
            end 
        end
    end

    
    def update_password
        updated_password = $prompt.mask("What would you like your new password to be?")
        @user.update(password: updated_password)
        buy_edit_cancel
    end


end