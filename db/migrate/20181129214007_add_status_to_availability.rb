class AddStatusToAvailability < ActiveRecord::Migration[5.2]
  def change
    add_column :availabilities, :status, :text
  end
end
