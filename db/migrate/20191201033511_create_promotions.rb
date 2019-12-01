class CreatePromotions < ActiveRecord::Migration[6.0]
  def change
    create_table :promotions do |t|
      t.integer :id
      t.integer :vendor_id
      t.string :name
      t.string :description
      t.string :photo_img
      t.time :start_time
      t.time :end_time
      t.string :status

      t.timestamps
    end
  end
end
