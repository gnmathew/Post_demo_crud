class CreatePostMoodShips < ActiveRecord::Migration[7.0]
  def change
    create_table :post_mood_ships do |t|
      t.references :post
      t.references :mood

      t.timestamps
    end
  end
end
