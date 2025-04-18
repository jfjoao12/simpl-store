# app/models/phone.rb
class Phone < ApplicationRecord
  belongs_to :phone_feature

  # … any other associations/validations …

  # Whitelist all columns you want to be searchable/filterable:
  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      phone_feature_id
      model
      color
      price
      storage_size
      imei_number
      created_at
      updated_at
    ]
  end

  # Whitelist any associations you might filter on (e.g. by phone_feature):
  def self.ransackable_associations(auth_object = nil)
    %w[phone_feature]
  end
end
