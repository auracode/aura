class ChangeInstallationdateStringToDate < ActiveRecord::Migration
  def self.up 
  	Customer.reset_column_information
  	change_column  :customers, :installation_date, :date
  end

  def self.down
  	change_column :customers, :installation_date, :string
  end
end
