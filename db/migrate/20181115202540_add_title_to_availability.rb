class AddTitleToAvailability < ActiveRecord::Migration[5.2]
  def change
    add_column :availabilities, :title, :string
  end
end
