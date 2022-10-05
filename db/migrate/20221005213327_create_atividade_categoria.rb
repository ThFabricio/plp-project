class CreateAtividadeCategoria < ActiveRecord::Migration[7.0]
  def change
    create_table :atividade_categoria do |t|
      t.references :atividade, null: false, foreign_key: true
      t.references :categorium, null: false, foreign_key: true
      t.timestamps
    end
  end
end
