class AddStartToAvailability < ActiveRecord::Migration[5.2]
  def change
    add_column :availabilities, :start, :datetime
  end
end
