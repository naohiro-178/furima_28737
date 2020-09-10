class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id,              null: false, foreign_key: true
      t.string :name,                   null: false
      t.integer :price,                  null: false
      t.text :explanation
      t.integer :category_id,       null: false
      t.integer :bland_id,             null: false
      t.integer :shipping_id,       null: false
      t.integer :shipping_area,   null: false
      t.integer :shipping_date,   null: false
      t.timestamps
    end
  end
end

l