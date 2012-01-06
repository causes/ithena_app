class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :card_number
      t.string :card_type
      t.string :expdate_month
      t.string :expdate_year
      t.string :cvv_number

      t.timestamps
    end
  end
end
