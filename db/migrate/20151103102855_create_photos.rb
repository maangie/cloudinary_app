class CreatePhotos < ActiveRecord::Migration[4.2]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image
      t.integer :bytes

      t.timestamps null: false
    end
  end
end
