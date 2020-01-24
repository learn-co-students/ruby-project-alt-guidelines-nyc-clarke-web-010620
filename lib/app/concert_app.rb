$prompt = TTY::Prompt.new 

class ConcertApp

    def run
        name = welcome
        login_choices(name)
        buy_edit_cancel  
    end


    def welcome
        system("clear")
        puts "Welcome to our Concert App!"
        name = $prompt.ask("What is your name?")
        name
    end 


    def find_user(string)
        User.all.find_by(name: string)
    end 


    def login_choices(name)
        choices = $prompt.select ("Hi #{name.capitalize}! What would you like to do?") do |menu|
            menu.choice "Sign In", -> {signin}
            menu.choice "Sign Up", -> {signup}
        end
    end
    

    def signin
        username_input = $prompt.ask("What is your username?")
        @user = User.find_by!(username: username_input) 
        password_input = $prompt.mask("Welcome back! What is your password?")
        # @user = User.find_by!(password: password_input) 
        if password_input != @user.password
            puts "Incorrect Password!"
            signin
        else
        @user = User.find_by!(password: password_input) 
        end
    end


    def signup
        new_username = $prompt.ask("What would you like your username to be?")
        new_password = $prompt.mask("What would you like your password to be?")
        @user = User.create(username: new_username, password: new_password)     
    end


    def buy_edit_cancel
        option = $prompt.select("What would you like to do?") do |menu|
            menu.choice "Buy Ticket", -> {list_concerts}
            menu.choice "Refund Tickets", -> {refund_tickets}
            menu.choice "Update Password", -> {update_password}
            menu.choice "Sign Out"
        end
        option
    end 

    
    def list_concerts
        concert_input = $prompt.select ("These are the concerts of 2020:") do |menu|
            Concert.all.each do |concert|
                menu.choice concert.artist_name + " at " + concert.venue_name, -> do 
                    new_ticket = Ticket.create(user_id: @user.id,concert_id: concert.id)
                    puts "Ticket was successfully purchesed!"
                    buy_edit_cancel 
                end  
            end 
        end 
    end 


    def refund_tickets
        current_ticket = $prompt.select ("These are all your purchased tickets!") do |menu|
            @user.tickets.each do |ticket|
                menu.choice ticket.concert.artist_name, -> do 
                    ticket.destroy
                    puts "Refund Complete! Go back to the main menu to purchase a new ticket!"
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
