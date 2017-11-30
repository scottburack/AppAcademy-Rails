# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user1 = User.create(email: 'ryan@aol.com', password: 'lacrosse')
user2 = User.create(email: 'chris@aol.com', password: 'lacrosse')
user3 = User.create(email: 'nicolette@aol.com', password: 'lacrosse')
user4 = User.create(email: 'karina@aol.com', password: 'lacrosse')

Band.destroy_all

band1 = Band.create(name: 'Weezer')
band1 = Band.create(name: 'Stone Temple Pilots')
band1 = Band.create(name: 'Other Brothers')
band1 = Band.create(name: 'B.Miles')
band1 = Band.create(name: 'Beatles')
