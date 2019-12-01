class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.integer :id
      t.integer :used_id
      t.string :name

      t.timestamps
    end
  end
end
