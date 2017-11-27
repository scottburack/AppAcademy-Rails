# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string
#  img_url    :string
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, uniqueness: { scope: :artist_id,
    message: 'Artist cannot have same title for multiple artworks'}
  validates :artist_id, :title, presence: true
  
  belongs_to :artist, 
   class_name: 'User', 
   foreign_key: :artist_id
   
   has_many :artwork_shares,
    class_name: 'ArtworkShare',
    foreign_key: :artwork_id
    
  has_many :viewers,
    through: :artwork_shares,
    source: :viewer
    
  has_many :comments, 
    class_name: 'Comment',
    foreign_key: :artwork_id
   
end
