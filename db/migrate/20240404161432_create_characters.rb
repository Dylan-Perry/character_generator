class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.string :style
      t.string :name
      t.string :description
      t.string :gender
      t.string :homeland
      t.string :skin_color
      t.string :hair_color
      t.string :likes
      t.string :dislikes
      t.string :portrait

      t.timestamps
    end
  end
end
