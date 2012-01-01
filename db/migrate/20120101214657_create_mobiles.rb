class CreateMobiles < ActiveRecord::Migration
  def change
    create_table :mobiles do |t|
      t.string :mobile_number
      t.integer :user_id

      t.timestamps
    end
  end
end
