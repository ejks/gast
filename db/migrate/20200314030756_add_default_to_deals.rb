class AddDefaultToDeals < ActiveRecord::Migration[6.0]
  def up
    change_column :deals, :cancel, :boolean, default: false
  end

  def down
    change_column :deals, :cancel, :boolean, default: nil
  end
end
