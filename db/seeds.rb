User.destroy_all
Concert.destroy_all
Ticket.destroy_all

user1 = User.create(name: "peter", username: "peter1", password: "peter12")
user2 = User.create(name: "anthony", username: "anthony1", password: "anthony12")
user3 = User.create(name: "natalia", username: "natalia1", password: "natalia12")
user4 = User.create(name: "katherine", username: "katherine1", password: "katherine12")
user5 = User.create(name: "mari", username: "mari1", password: "mari12")
user6 = User.create(name: "james", username: "james1", password: "james12")


concert1 = Concert.create(artist_name: "Rihanna", venue_name: "MetLife", concert_date: "2/2/2020", price: 200)
concert2 = Concert.create(artist_name: "Drake", venue_name: "Webster Hall", concert_date: "5/5/2020", price: 150)
concert3 = Concert.create(artist_name: "Imagine Dragons", venue_name: "Brooklyn Mirage", concert_date: "3/7/2020", price: 65)
concert4 = Concert.create(artist_name: "Arctic Monkeys", venue_name: "Ballroom", concert_date: "6/5/2020", price: 400)
concert5 = Concert.create(artist_name: "Wyclef Jean", venue_name: "Madison Square Garden", concert_date: "8/19/2020", price: 600)
concert6 = Concert.create(artist_name: "Billy Joel", venue_name: "Barclays Center", concert_date: "4/17/2020", price: 185)
concert7 = Concert.create(artist_name: "Elton John", venue_name: "Terminal 5", concert_date: "5/6/2020", price: 95)
concert8 = Concert.create(artist_name: "ACDC", venue_name: "Madison Square Garden", concert_date: "10/1/2020", price: 300)
concert9 = Concert.create(artist_name: "Ariana Grande", venue_name: "City Field", concert_date: "6/10/2020", price: 255)
concert10 = Concert.create(artist_name: "Khalid", venue_name: "Barclays Center", concert_date: "6/19/2020", price: 350)
concert11 = Concert.create(artist_name: "Lady Gaga", venue_name: "Kings Theater", concert_date: "12/21/2020", price: 150)


# ticket1 = Ticket.create(user_id: user1.id, concert_id: concert2.id)
# ticket2 = Ticket.create(user_id: user2.id, concert_id: concert5.id)
# ticket3 = Ticket.create(user_id: user1.id, concert_id: concert4.id)
# ticket4 = Ticket.create(user_id: user5.id, concert_id: concert10.id)
# ticket5 = Ticket.create(user_id: user3.id, concert_id: concert9.id)
# ticket6 = Ticket.create(user_id: user4.id, concert_id: concert11.id)