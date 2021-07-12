# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create seeds
author1 = Author.create!(first_name: 'Robert', last_name: 'Salvatore')
author2 = Author.create!(first_name: 'Fedor', last_name: 'Dostoevsky')
genre1 = Genre.create!(name: 'Fantasy')
genre2 = Genre.create!(name: 'Novel')
Book.create!(title: 'The Demon Wakes Up', author_id: author1.id, genre_id: genre1.id, year: 2002, quantity: 10)
Book.create!(title: 'Spirit Of The Demon', author_id: author1.id, genre_id: genre1.id, year: 2004, quantity: 10)
Book.create!(title: 'Crime and Punishment', author_id: author2.id, genre_id: genre2.id, year: 1866, quantity: 15)
Book.create!(title: 'The Player', author_id: author2.id, genre_id: genre2.id, year: 1866, quantity: 15)
Librarian.create!(email: 'lib@lib.com', password: 'password', first_name: 'Obi', last_name: 'Wan Kenobi', role: User::roles['librarian'])
Customer.create!(email: 'cust@cust.com', password: 'password', first_name: 'Luke', last_name: 'Skywalker', role: User::roles['customer'])
