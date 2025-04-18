ActiveAdmin.register Customer do
  permit_params :phone_id, :name, :phone_number, :address

  # Optional: customize the columns shown on the index page
  index do
    selectable_column
    id_column
    column :name
    column :phone_number
    column :phone             # shows linked Phone record
    column :address
    actions
  end

  # Optional: add filters in the sidebar
  filter :name
  filter :phone_model, as: :string, label: "Phone Model",
         collection: proc { Phone.pluck(:model) }
  filter :phone_number

  # Customize the form for new/edit
  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :phone, as: :select, collection: Phone.all.map { |p| [ p.model, p.id ] }
      f.input :name
      f.input :phone_number
      f.input :address
    end
    f.actions
  end

  # Optional: show page customization
  show do
    attributes_table do
      row :id
      row :name
      row :phone_number
      row :address
      row :phone do |customer|
        link_to customer.phone.model, admin_phone_path(customer.phone)
      end
      row :created_at
      row :updated_at
    end
  end
end
