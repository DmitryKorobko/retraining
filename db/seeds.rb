# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create seeds

if Author.present?
  Author.create!(first_name: 'Robert', last_name: 'Salvatore')
  Author.create!(first_name: 'Fedor', last_name: 'Dostoevsky')
end

if Genre.present?
  Genre.create!(name: 'Fantasy')
  Genre.create!(name: 'Novel')
end

if Book.present?
  Book.create!(title: 'The Demon Wakes Up', author_id: Author.first.id, year: 2002, quantity: 10, genre_ids: [Genre.first.id])
  Book.create!(title: 'Spirit Of The Demon', author_id: Author.first.id, year: 2004, quantity: 10, genre_ids: [Genre.first.id])
  Book.create!(title: 'Crime and Punishment', author_id: Author.last.id, year: 1866, quantity: 15, genre_ids: [Genre.last.id])
  Book.create!(title: 'The Player', author_id: Author.last.id, year: 1866, quantity: 15, genre_ids: [Genre.last.id])
end

if User.present?
  Librarian.create!(email: 'lib@lib.com', password: 'password', first_name: 'Obi', last_name: 'Wan Kenobi')
  Customer.create!(email: 'cust@cust.com', password: 'password', first_name: 'Luke', last_name: 'Skywalker')
end
