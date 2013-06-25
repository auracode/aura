class AddDetailsToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :consumer_no, :integer
    add_column :customers, :flavors, :string
    add_column :customers, :machine_count, :integer
    add_column :customers, :plan, :integer
  end
end
