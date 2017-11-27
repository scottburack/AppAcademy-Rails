class CreateArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.string :title, presence: true
      t.string :img_url, presence: true 
      t.integer :artist_id, presence: true 
      
      t.timestamps
    end
    add_index :artworks, :title 
    add_index :artworks, :artist_id
  end
end
