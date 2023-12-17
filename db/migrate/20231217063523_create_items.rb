class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      # テーブルのカラム定義など
      t.string :item_title        , null: false
      t.integer :price            , null: false
      t.text :item_description    , null: false
      t.references :user          , null: false, foreign_key: true
      t.integer :category_id      , null: false
      t.integer :condition_id     , null: false
      t.integer :shipping_cost_id , null: false
      t.integer :prefecture_id    , null: false
      t.integer :shipping_date_id , null: false

      t.timestamps
    end
  end
end
