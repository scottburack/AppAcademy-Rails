# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
user1 = User.create(username: 'Scott123')
user2 = User.create(username: 'Bundles')
user3 = User.create(username: 'DogFace')

Artwork.destroy_all
artwork1 = Artwork.create(title: 'Dog', img_url: 'dog.com', artist_id: user1.id)
artwork2 = Artwork.create(title: 'Cat', img_url: 'cat.com', artist_id: user2.id)
artwork3 = Artwork.create(title: 'Mountain', img_url: 'mountain.com', artist_id: user3.id)
artwork4 = Artwork.create(title: 'Dolphin', img_url: 'dolphin.com', artist_id: user3.id)

ArtworkShare.destroy_all
share1 = ArtworkShare.create(viewer_id: user1.id, artwork_id: artwork2.id)
share2 = ArtworkShare.create(viewer_id: user2.id, artwork_id: artwork3.id)
share3 = ArtworkShare.create(viewer_id: user1.id, artwork_id: artwork4.id)

