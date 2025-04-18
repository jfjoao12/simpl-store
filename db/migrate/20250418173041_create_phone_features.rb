class CreatePhoneFeatures < ActiveRecord::Migration[8.0]
  def change
    create_table :phone_features do |t|
      t.string :brand
      t.string :main_camera_info
      t.string :selfie_camera_info
      t.string :chipset
      t.string :os
      t.string :cpu
      t.string :gpu
      t.string :battery

      t.timestamps
    end
  end
end
