class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone_number
      t.text :address
      t.string :area

      t.timestamps
    end
  end
end
