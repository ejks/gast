class CreateDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :promotion, null: false, foreign_key: true
      t.boolean :cancel

      t.timestamps
    end
  end
end
