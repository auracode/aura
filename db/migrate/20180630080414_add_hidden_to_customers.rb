class AddHiddenToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :hidden, :boolean , :default => false
  end
end
