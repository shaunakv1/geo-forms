class AddLocationIdToCheckins < ActiveRecord::Migration
  def change
    add_column :checkins, :location_id, :integer
  end
end
