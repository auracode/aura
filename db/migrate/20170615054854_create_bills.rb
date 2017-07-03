class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :bill_type
      t.integer :bill_no
      t.date :issue_date
      t.integer :amount
      t.string :status
      t.integer :cheque_no
      t.string :bank_name
      t.date :credited_on
      t.integer :remaining_amount
      t.string :collected_by

      t.timestamps
    end
  end
end
