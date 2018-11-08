class AddEndToAvailability < ActiveRecord::Migration[5.2]
  def change
    add_column :availabilities, :end, :datetime
  end
end
