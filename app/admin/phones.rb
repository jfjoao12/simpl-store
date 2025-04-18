ActiveAdmin.register Phone do
  permit_params :phone_feature_id, :model, :color, :price, :storage_size, :imei_number

  index do
    selectable_column
    id_column
    column :model
    column :color
    column :price
    column :storage_size
    column :imei_number
    column :phone_feature    # shows linked PhoneFeature record
    actions
  end

  filter :model
  filter :color
  filter :storage_size
  filter :imei_number

  form do |f|
    f.semantic_errors
    f.inputs do
      # f.input :phone_feature, as: :select, collection: PhoneFeature.all.map { |pf| [ pf.brand, pf.id ] } made it auto in the future!
      f.input :model
      # f.input :color
      f.input :price
      f.input :storage_size
      f.input :imei_number
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :model
      row :color
      row :price
      row :storage_size
      row :imei_number
      row :phone_feature do |phone|
        link_to phone.phone_feature.brand, admin_phone_feature_path(phone.phone_feature)
      end
      row :created_at
      row :updated_at
    end
  end
end
