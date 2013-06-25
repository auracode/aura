class AddInstallationdateToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :installation_date, :string
  end
end
