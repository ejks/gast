class ChangeTypeToServeTypeFromVendor < ActiveRecord::Migration[6.0]
  def change
    rename_column :vendors, :type, :vendor_type
  end
end
