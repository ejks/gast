class CreateDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.integer :id
      t.integer :customer_id
      t.integer :promotion_id
      t.boolean :cancel

      t.timestamps
    end
  end
end
