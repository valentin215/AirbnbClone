class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.string :address
      t.integer :capacity
      t.string :picture
      t.float :lat
      t.float :long
      t.float :price
      t.text :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
