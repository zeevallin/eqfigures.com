class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|

      t.string  :name
      t.string  :slug
      t.string  :portrait

      t.integer :rating,    default: 1000

      t.timestamps
    end
  end
end
