class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :card_number
      t.string :card_type
      t.string :expdate_month
      t.string :expdate_year
      t.string :cvv_number

      t.timestamps
    end
  end
end
