class CreateLaws < ActiveRecord::Migration[5.2]
  def change
    create_table :laws do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
