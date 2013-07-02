class AddQuoteToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :quote, :integer
  end
end
