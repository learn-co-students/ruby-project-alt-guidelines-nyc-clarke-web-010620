$prompt = TTY::Prompt.new 

class ConcertApp
    # require 'tty-prompt'

    def run
        name = welcome
        login_choices(name)
        buy_edit_cancel
        list_concerts
    end

    def welcome
        system("clear")
        puts "Welcome to our TicketApp! "
        name = $prompt.ask("What's your name?")
        name
    end 

    # # def find_user(string)
    # #     User.all.find_by(name: string)
    # end 

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

    def buy_edit_cancel
        option = $prompt.select("What would you like to do?") do |menu|
            menu.choice "Buy Ticket", 1
            menu.choice "Edit Ticket", 2
            menu.choice "Cancel Ticket", 3
        end

        option
    end 

    def optional
        case 
            when buy_edit_cancel == 1  # if customer picks first choice (Buy tickt)
                list_concerts
                #
                #new_ticket = Ticket.create()


        end 
    end 


    def list_concerts
        list = [] 
        Concert.all.each do |concert|
            list << concert 
        end 
            
        concert_input = $prompt.select ('These are the concerts of 2020') do |menu|
            menu.choice list[0].artist_name , 1
            menu.choice list[1].artist_name , 2
            menu.choice list[2].artist_name , 3
            menu.choice list[3].artist_name , 4
            menu.choice list[4].artist_name , 5
        end  

        case 
            when concert_input == 1
                new_ticket = Ticket.create(@user.id, @concert.id)  #ticket1 = Ticket.create(user_id: user1.id, concert_id: concert2.id)

            when concert_input == 2
                new_ticket = Ticket.create(@user.id, @concert.id)  

            when concert_input == 3
                new_ticket = Ticket.create(@user.id, @concert.id)  

            when concert_input == 4
                new_ticket = Ticket.create(@user.id, @concert.id)  

            when concert_input == 5
                new_ticket = Ticket.create(@user.id, @concert.id)  

        end 
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

# run 

