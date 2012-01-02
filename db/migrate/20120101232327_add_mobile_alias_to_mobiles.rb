class AddMobileAliasToMobiles < ActiveRecord::Migration
  def change
    add_column :mobiles, :mobile_alias, :string
  end
end
