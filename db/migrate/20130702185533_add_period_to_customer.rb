class AddPeriodToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :period, :integer
  end
end
