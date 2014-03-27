class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :locale, :string
    add_column :users, :time_zone, :string
    add_column :users, :ip, :string
  end
end
