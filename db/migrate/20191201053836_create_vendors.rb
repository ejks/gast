class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :contact_number
      t.integer :type
      t.string :address
      t.string :description
      t.string :logo_img

      t.timestamps
    end
  end
end
