class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :name ,null: false
      t.string :text
      t.float :latitude
      t.float :longitude
      t.string :address
      t.integer :genre_id  , null: false
      t.timestamps
    end
  end
end
