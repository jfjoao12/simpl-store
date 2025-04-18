class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.references :phone, null: false, foreign_key: true
      t.string :name
      t.string :phone_number
      t.string :address

      t.timestamps
    end
  end
end
