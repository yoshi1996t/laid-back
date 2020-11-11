class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :name
      t.string :text
      t.float :latitude
      t.float :longitude
      t.string :address
      t.timestamps
    end
  end
end
