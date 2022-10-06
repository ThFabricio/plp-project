class AddDatasToMeta < ActiveRecord::Migration[7.0]
  def change
    add_column :meta, :start_time, :date
    add_column :meta, :end_time, :date
  end
end
