class AddDatasToMeta < ActiveRecord::Migration[7.0]
  def change
    add_column :meta, :start_time, :datetime
    add_column :meta, :end_time, :datetime
  end
end
