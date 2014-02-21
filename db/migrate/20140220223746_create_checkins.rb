class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
