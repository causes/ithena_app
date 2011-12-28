class AddBirthdayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :month, :string
    add_column :users, :day, :string
    add_column :users, :year, :string
  end
end
