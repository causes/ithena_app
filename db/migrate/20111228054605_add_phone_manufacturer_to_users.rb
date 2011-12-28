class AddPhoneManufacturerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_manufacturer, :string
  end
end
