class AddAccuracyToCheckins < ActiveRecord::Migration
  def change
    add_column :checkins, :accuracy, :integer
  end
end
