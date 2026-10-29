# photos テーブルを作るマイグレーション。
class CreatePhotos < ActiveRecord::Migration[4.2]
  # photos テーブルを作る。ロールバックではテーブルを消す。
  #
  # 戻り値:: なし
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image
      t.integer :bytes

      t.timestamps null: false
    end
  end
end
