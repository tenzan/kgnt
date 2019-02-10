class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :location
      t.integer :price
      t.string :currency
      t.string :phone
      t.string :purpose
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
