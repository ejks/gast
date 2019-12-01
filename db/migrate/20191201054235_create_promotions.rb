class CreatePromotions < ActiveRecord::Migration[6.0]
  def change
    create_table :promotions do |t|
      t.references :vendor, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :status
      t.string :photo_img

      t.timestamps
    end
  end
end
