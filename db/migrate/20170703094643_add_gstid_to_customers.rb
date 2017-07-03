class AddGstidToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :gstid, :string
  end
end
