class AddTestNameToAvailability < ActiveRecord::Migration[5.2]
  def change
    add_column :availabilities, :test_name, :string
  end
end
