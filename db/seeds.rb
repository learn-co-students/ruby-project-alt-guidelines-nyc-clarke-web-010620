User.destroy_all
Concert.destroy_all

user1 = User.create(username: "mike")
user2 = User.create(username: "michelle")

concert1 = Concert.create(venue_name: "MSG")
concert2 = Concert.create(venue_name: "Terminal 5")

ticket = Ticket.create(user_id: user1.id, concert_id: concert1.id)

# user1.concerts << concert1 
