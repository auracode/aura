class AddHowToReachToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :how_to_reach, :text
  end
end
