class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :author
      t.text :name
      t.text :genre
      t.integer :ownRating
      t.text :googleId

      t.timestamps
    end
  end
end
