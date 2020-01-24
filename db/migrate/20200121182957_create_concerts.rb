class CreateConcerts < ActiveRecord::Migration[5.2]
  def change
    create_table :concerts do |t|
      t.string :artist_name
      t.string :venue_name
      t.string :concert_date 
      t.integer :price
      t.timestamps
    end 
  end
end
