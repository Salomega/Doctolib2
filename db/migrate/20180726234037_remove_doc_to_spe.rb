class RemoveDocToSpe < ActiveRecord::Migration[5.2]
  def change
  	remove_column :specialties, :doctor_id, :integer
  end
end
