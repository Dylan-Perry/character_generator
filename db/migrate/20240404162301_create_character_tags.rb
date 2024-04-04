class CreateCharacterTags < ActiveRecord::Migration[7.1]
  def change
    create_table :character_tags do |t|
      t.references :characters, null: false, foreign_key: true
      t.references :tags, null: false, foreign_key: true

      t.timestamps
    end
  end
end
