class CreatePhones < ActiveRecord::Migration[8.0]
  def change
    create_table :phones do |t|
      t.references :phone_feature, null: false, foreign_key: true
      t.string :model
      t.string :color
      t.string :price
      t.string :storage_size
      t.string :imei_number

      t.timestamps
    end
  end
end
