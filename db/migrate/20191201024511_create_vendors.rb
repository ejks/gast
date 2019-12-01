class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.integer :id
      t.integer :user_id
      t.string :name
      t.string :contact_number
      t.string :type
      t.string :address
      t.string :description
      t.string :logo_img

      t.timestamps
    end
  end
end
