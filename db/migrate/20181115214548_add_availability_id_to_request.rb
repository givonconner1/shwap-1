class AddAvailabilityIdToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :availability_id, :integer
  end
end
