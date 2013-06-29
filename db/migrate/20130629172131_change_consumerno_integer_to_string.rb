class ChangeConsumernoIntegerToString < ActiveRecord::Migration
  def self.up 
  	change_column  :customers, :consumer_no, :string
  end

  def self.down
  	change_column :customers, :consumer_no, :integer
  end
end
