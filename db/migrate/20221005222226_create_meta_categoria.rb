class CreateMetaCategoria < ActiveRecord::Migration[7.0]
  def change
    create_table :meta_categoria do |t|
      t.references :metum, null: false, foreign_key: true
      t.references :categorium, null: false, foreign_key: true
      t.timestamps
    end
  end
end
