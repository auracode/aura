class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :bill_id
      t.integer :customer_id
      t.date :reminder
      t.string :remark

      t.timestamps
    end
  end
end
