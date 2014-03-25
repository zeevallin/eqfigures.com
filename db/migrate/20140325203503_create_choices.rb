class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|

      t.integer :a
      t.integer :b
      t.integer :x

      t.integer :user_id

      t.timestamps
    end
  end
end
