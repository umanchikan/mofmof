class CreateNearStations < ActiveRecord::Migration[5.2]
  def change
    create_table :near_stations do |t|
      t.string :line_name
      t.string :station_name
      t.string :minutes
      t.timestamps
    end
  end
end
