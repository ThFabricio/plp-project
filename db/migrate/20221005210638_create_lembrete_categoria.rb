class CreateLembreteCategoria < ActiveRecord::Migration[7.0]
  def change
    create_table :lembrete_categoria do |t|
      t.references :lembrete, null: false, foreign_key: true
      t.references :categorium, null: false, foreign_key: true
      t.timestamps
    end
  end
end
