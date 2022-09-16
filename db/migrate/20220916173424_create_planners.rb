class CreatePlanners < ActiveRecord::Migration[7.0]
  def change
    create_table :planners do |t|

      t.timestamps
    end
  end
end
