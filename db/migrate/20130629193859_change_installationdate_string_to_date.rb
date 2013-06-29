class ChangeInstallationdateStringToDate < ActiveRecord::Migration
  def self.up 
  	Customer.reset_column_information
  connection.execute(%q{
    alter table customers
    alter column installation_date
    type date using cast(string as date)
  })
  	change_column  :customers, :installation_date, :date
  end

  def self.down
  	change_column :customers, :installation_date, :string
  end
end
