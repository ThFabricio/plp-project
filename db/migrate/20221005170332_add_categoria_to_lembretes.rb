class AddCategoriaToLembretes < ActiveRecord::Migration[7.0]
  def change
    add_reference :lembretes, :categoria, null: false, foreign_key: true
  end
end
