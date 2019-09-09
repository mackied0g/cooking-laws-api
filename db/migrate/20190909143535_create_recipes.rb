class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.integer :yield
      t.string :ingredients
      t.string :instructions
      t.integer :law_id

      t.timestamps
    end
  end
end
