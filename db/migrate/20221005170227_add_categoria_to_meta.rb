class AddCategoriaToMeta < ActiveRecord::Migration[7.0]
  def change
    add_reference :meta, :categoria, null: false, foreign_key: true
  end
end
